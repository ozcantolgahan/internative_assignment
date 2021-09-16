import 'package:internative_assignment/src/models/user_model.dart';
import 'package:internative_assignment/src/services/repository.dart';
import "package:mobx/mobx.dart";
import 'package:shared_preferences/shared_preferences.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  var repository = Repository();
  SharedPreferences? prefs;

  @observable
  ObservableList<UserModel> users = ObservableList<UserModel>();

  @observable
  bool isLoading = false;

  @observable
  ObservableList<UserModel> friends = ObservableList<UserModel>();

  @action
  getAllUsers(String myId) async {
    try{
      isLoading = true;
      prefs = await SharedPreferences.getInstance();
      var token = prefs!.getString("Token");
      List<UserModel> data = await repository.getAllUsers(token!, myId);
      users = ObservableList<UserModel>();
      for (var i = 0; i < data.length; i++) {
        users.add(data[i]);
      }
      isLoading = false;
      return true;
    }catch(e){
      return false;
    }
  }

  @action
  getUserDetails(String userId) async {
    isLoading = true;
    prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString("Token");
    print(token);
    var user = await repository.getUserDetails(userId, token!);
    isLoading = false;
    return user;
  }

  @action
  getAllFriends() async {

    try{
      isLoading = true;
      prefs = await SharedPreferences.getInstance();
      friends = ObservableList<UserModel>();
      var token = prefs!.getString("Token");
      print(token);
      var data = await repository.getAllFriends(token!);
      for (var i = 0; i < data.length; i++) {
        friends.add(data[i]);
      }

      for (var i = 0; i < friends.length; i++) {
        for (var j = 0; j < users.length; j++) {
          if (friends[i].id == users[j].id) users.remove(users[j]);
        }
      }

      print(users);
      isLoading = false;
      return true;
    }catch(e){
      return false;
    }
  }

  @action
  addToFriends(String userId, String myId) async {
    prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString("Token");
    print(token);
    var result = await repository.addToFriends(userId, token!, myId);
    print(token);
    var userFounded = users.firstWhere((element) => element.id == userId);
    users.remove(userFounded);
    friends.add(userFounded);
  }

  @action
  removeFromFriends(String userId) async {
    prefs = await SharedPreferences.getInstance();
    var token = prefs!.getString("Token");
    print(token);
    var result = await repository.removeFromFriends(userId, token!);
    var userFounded = friends.firstWhere((element) => element.id == userId);
    users.add(userFounded);
    friends.remove(userFounded);
  }
}
