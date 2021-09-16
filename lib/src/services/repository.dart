import 'package:internative_assignment/src/services/api_service.dart';

class Repository {
  final apiService = ApiService();

  login(String email, String password) =>
      apiService.login(email, password);
  getUser(String token)=>apiService.getUser(token);
  getAllUsers(String token,String myId)=>apiService.getAllUsers(token,myId);
  getUserDetails(String userId,String token)=>apiService.getUserDetails(userId,token);
  getAllFriends(String token)=>apiService.getAllFriends(token);
  addToFriends(String userId,String token,String myId)=>apiService.addToFriends(userId,token,myId);
  removeFromFriends(String userId,String token)=>apiService.removeFromFriends(userId,token);
}
