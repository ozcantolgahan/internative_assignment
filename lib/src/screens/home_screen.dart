import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_assignment/src/app.dart';
import 'package:internative_assignment/src/screens/user_screen.dart';
import 'package:internative_assignment/src/store/authentication_store.dart';
import 'package:internative_assignment/src/store/post_store.dart';
import 'package:internative_assignment/src/styles/textStyles.dart';
import 'package:internative_assignment/src/widgets/AppButton.dart';
import 'package:internative_assignment/src/widgets/userCards.dart';
import 'package:mobx/mobx.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (postStore.isLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (Platform.isIOS)
            return CupertinoPageScaffold(child: pageBody(context));
          else
            return Scaffold(
              body: pageBody(context),
            );
        }
      },
    );
  }

  Widget pageBody(context) {

    return SafeArea(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Users",
                  style: TextStyles.title,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  "All Users Are Here",
                  style: TextStyles.subTitle,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.45,
                  child: Observer(
                    builder: (context) => ListView.builder(
                        itemBuilder: (context, index) {
                          if (postStore.friends
                                  .map((element) =>
                                      element.id == postStore.users[index].id)
                                  .toString() ==
                              "(true)") {
                            return Container();
                          } else {
                            return UserCards(
                              user: postStore.users[index],
                              addOnPressed: () {
                                postStore.addToFriends(
                                    postStore.users[index].id!,
                                    authStore.user!.id!);
                              },
                              friendList: false,
                            );
                          }
                        },
                        itemCount: postStore.users.length),
                  ),
                ),
                Container(
                  child: Text(
                    "Your Friends",
                    style: TextStyles.title,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Observer(builder: (context) {
                    var friends = postStore.friends;
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return UserCards(
                            friendList: true,
                            user: friends[index],
                            deleteOnPressed: () {
                              postStore.removeFromFriends(friends[index].id!);
                            });
                      },
                      itemCount: friends.length,
                    );
                  }),
                ),
              ],
            ),
          )),
    );
  }
}
