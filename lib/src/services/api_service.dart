import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:internative_assignment/src/models/user_model.dart';

class ApiService {
  final _url = "http://test13.internative.net/";

  login(String email, String password) async {
    final response = await http.post(Uri.parse(_url + "Login/SignIn"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({"Email": email, "Password": password}));
    var responseBody = jsonDecode(response.body);
    if (responseBody["HasError"])
      return "Error";
    else
      return responseBody["Data"]["Token"];
  }

  getUser(String token) async {
    final response = await http.get(
      Uri.parse(_url + "Account/Get"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token
      },
    );
    var responseBody = json.decode(response.body);
    UserModel userModel = UserModel.fromJson(responseBody["Data"]);
    print(userModel.friendIds);
    return userModel;
  }

  getAllUsers(String token, String myId) async {
    List<UserModel> users = [];
    final response = await http.get(
      Uri.parse(_url + "User/GetUsers"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token
      },
    );
    var responseBody = json.decode(response.body);
    var data = responseBody["Data"];
    for (var i = 0; i < data.length; i++) {
      if (UserModel.fromJson(data[i]).id == myId)
        continue;
      else
        users.add(UserModel.fromJson(data[i]));
    }
    return users;
  }

  getUserDetails(String userId, String token) async {
    final response = await http.post(Uri.parse(_url + "User/GetUserDetails"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token
        },
        body: jsonEncode({"Id": userId}));
    var responseBody = json.decode(response.body);
    var userModel = UserModel.fromJson(responseBody["Data"]);
    return userModel;
  }

  getAllFriends(String token) async {
    List<UserModel> users = [];
    final response = await http.get(
      Uri.parse(_url + "Account/GetFriendList"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer " + token
      },
    );

    var responseBody = json.decode(response.body);
    var data = responseBody["Data"];
    for (var i = 0; i < data.length; i++) {
      users.add(UserModel.fromJson(data[i]));
    }
    print(users);
    return users;
  }

  addToFriends(String userId, String token, String myId) async {
    final response = await http.post(Uri.parse(_url + "User/AddToFriends"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token
        },
        body: jsonEncode({"UserId": userId}));
    var responseData = json.decode(response.body);
    print(response.body);
    UserModel user = UserModel.fromJson(responseData["Data"]);
    return user.friendIds;
  }

  removeFromFriends(String userId, String token) async {
    final response = await http.post(Uri.parse(_url + "User/RemoveFromFriends"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer " + token
        },
        body: jsonEncode({"UserId": userId}));
    var user = UserModel.fromJson(json.decode(response.body)["Data"]);
    return user;
  }
}
