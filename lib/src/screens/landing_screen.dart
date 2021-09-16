import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_assignment/src/screens/home_screen.dart';
import 'package:internative_assignment/src/screens/login_screen.dart';
import 'package:internative_assignment/src/store/authentication_store.dart';
import 'package:internative_assignment/src/store/post_store.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class LandingScreen extends StatefulWidget {
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    var authStore = Provider.of<AuthenticationStore>(context);
    var postStore = Provider.of<PostStore>(context);

    return Observer(builder: (context) {
      if (authStore.isLoading == true) {
        if (Platform.isIOS)
          return CupertinoPageScaffold(child: CupertinoActivityIndicator());
        else
          return Scaffold(
            body: CircularProgressIndicator(),
          );
      } else {
        if (authStore.user == null) {
          return LoginScreen();
        } else {
          postStore.getAllUsers(authStore.user!.id!);
          postStore.getAllFriends();


          return HomeScreen();
        }
      }
    });
  }
}
