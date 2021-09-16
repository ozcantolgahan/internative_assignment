import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_assignment/src/store/authentication_store.dart';
import 'package:internative_assignment/src/store/post_store.dart';
import 'package:internative_assignment/src/styles/textStyles.dart';
import 'package:internative_assignment/src/widgets/AppButton.dart';
import 'package:internative_assignment/src/widgets/textField.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var authStore = Provider.of<AuthenticationStore>(context);
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    if (Platform.isIOS) {
      return CupertinoPageScaffold(child: pageBody(context));
    } else {
      return Scaffold(
        key: _scaffoldKey,
        body: pageBody(context),
      );
    }
  }

  Widget pageBody(context) {
    var authStore = Provider.of<AuthenticationStore>(context);
    var postStore = Provider.of<PostStore>(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyles.title,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Sign in to continue!",
                      style: TextStyles.subTitle,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Observer(
                      builder: (context) => AppTextField(
                        errorText: (authStore.errorText == "")
                            ? null
                            : authStore.errorText,
                        onChanged: authStore.changeEmail,
                        keyboardType: TextInputType.text,
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Observer(
                      builder: (context) => AppTextField(
                        labelText: "Password",
                        obscureText: !authStore.showPassword,
                        keyboardType: TextInputType.number,
                        onChanged: authStore.changePassword,
                        iconData: !authStore.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        togglePassword: authStore.togglePassword,
                        showPassword: !authStore.showPassword,
                        errorText: (authStore.errorPasswordText == "")
                            ? null
                            : authStore.errorPasswordText,
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "Forget Password",
                        style: TextStyles.smallText,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      child: Observer(
                          builder: (context) => AppButton(
                                onPressed: authStore.applyValid
                                    ? () async {
                                        authStore.login().then((value) {
                                          if (value) {
                                            snackbar("Login successful", 800);
                                            postStore
                                                .getAllUsers(
                                                    authStore.user!.id!)
                                                .then((value) => postStore
                                                    .getAllFriends()
                                                    .then((value) {}));

                                            Navigator.pushReplacementNamed(
                                                context, "/home");
                                          } else {
                                            snackbar(
                                                "Email or Password is wrong",
                                                800);
                                          }
                                        });
                                      }
                                    : () {
                                        snackbar(
                                            "Fields Cannot Be Empty", 1000);
                                      },
                                text: "Login",
                              )),
                    ),
                  ],
                ),
                Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

  snackbar(content, seconds) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(content),
      duration: Duration(milliseconds: seconds),
    ));
  }
}
