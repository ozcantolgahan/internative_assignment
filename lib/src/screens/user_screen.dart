import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_assignment/src/app.dart';
import 'dart:io';

import 'package:internative_assignment/src/models/user_model.dart';

class UserScreen extends StatefulWidget {
  UserModel? user;

  UserScreen({this.user});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS)
      return CupertinoPageScaffold(child: pageBody(context));
    else
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  isAdded = true;
                });
                postStore.addToFriends(widget.user!.id!, authStore.user!.id!);
              },
              icon: Icon(isAdded ? Icons.person : Icons.add),
            )
          ],
        ),
        body: pageBody(context),
      );
  }

  Widget pageBody(context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                child: Image.network(widget.user!.profilePhoto!),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    widget.user!.fullName!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("First Name: " + widget.user!.firstName!),
                  Text("Last Name: " + widget.user!.lastName!),
                  Text("Birthday: " + widget.user!.birthDate!.split("T")[0]),
                  Text("Email: " + widget.user!.email!)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
