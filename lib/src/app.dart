import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:internative_assignment/src/routes.dart';
import 'package:internative_assignment/src/store/authentication_store.dart';
import 'package:internative_assignment/src/store/post_store.dart';
import 'package:provider/provider.dart';

final authStore = AuthenticationStore();
final postStore = PostStore();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => authStore),
        Provider(create: (context) => postStore)
      ],
      child: PlatformApp(),
    );
  }
}

class PlatformApp extends StatefulWidget {
  @override
  State<PlatformApp> createState() => _PlatformAppState();
}

class _PlatformAppState extends State<PlatformApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authStore.getUser();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoApp(
        onGenerateRoute: Routes.cupertinoRoutes,
        theme: CupertinoThemeData(scaffoldBackgroundColor: Colors.white),
      );
    } else {
      return MaterialApp(
        onGenerateRoute: Routes.materialRoutes,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
      );
    }
  }
}
