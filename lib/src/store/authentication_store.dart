import 'package:internative_assignment/src/models/user_model.dart';
import 'package:internative_assignment/src/services/repository.dart';
import "package:mobx/mobx.dart";
import 'package:shared_preferences/shared_preferences.dart';

part 'authentication_store.g.dart';

class AuthenticationStore = _AuthenticationStore with _$AuthenticationStore;

abstract class _AuthenticationStore with Store {
  var regExp = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  var repository = Repository();

  SharedPreferences? prefs;

  @observable
  String? email;

  @observable
  UserModel? user;

  @observable
  bool showPassword = false;

  @observable
  String errorText = "";

  @observable
  String errorPasswordText = "";

  @computed
  bool get isEmpty {
    if (email == "" || email == null || password == "" || password == null) {
      return false;
    } else {
      return true;
    }
  }

  @computed
  bool get applyValid =>
      (isEmpty && errorText.length == 0 && errorPasswordText.length == 0)
          ? true
          : false;

  @observable
  String? password;

  @observable
  bool isLoading = false;

  @action
  changeEmail(String value) {
    email = value;
    validateEmail();
  }

  @action
  changePassword(String value) {
    password = value;
    validatePassword();
  }

  @action
  void togglePassword() {
    showPassword = !showPassword;
  }

  @action
  validateEmail() {
    var control = regExp.hasMatch(email!);
    if (email == null) {
      errorText = "Please Add Email";
    } else if (!control || email!.length < 5) {
      errorText = "Please Add Correct Mail";
    } else if (email == "") {
    } else {
      errorText = "";
    }
  }

  @action
  validatePassword() {
    if (password == null) {
      errorPasswordText = "Password can't be empty";
    } else if (password!.length < 5) {
      errorPasswordText = "Too Short";
    } else {
      errorPasswordText = "";
    }
  }

  @action
  login() async {
    try {
      var result = await repository.login(email!, password!);
      if (result == "Error") return false;
      prefs = await SharedPreferences.getInstance();
      await prefs!.setString("Token", result);
      print(result);
      await getUser();
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  getUser() async {
    try {
      isLoading = true;
      prefs = await SharedPreferences.getInstance();
      var token = prefs!.getString("Token");
      if (token != null) {
        user = await repository.getUser(token);
      }
      isLoading = false;
    } catch (e) {
      isLoading = false;
      throw Exception("Error in getting user");
    }
  }
}
