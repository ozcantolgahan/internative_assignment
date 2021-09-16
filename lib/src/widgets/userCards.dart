import 'package:flutter/material.dart';
import 'package:internative_assignment/src/models/user_model.dart';
import 'package:internative_assignment/src/screens/user_screen.dart';
import 'package:internative_assignment/src/store/post_store.dart';
import 'package:internative_assignment/src/widgets/AppButton.dart';
import 'package:provider/provider.dart';

class UserCards extends StatelessWidget {
  UserModel? user;
  Function()? addOnPressed;
  Function()? visitOnPressed;
  Function()? deleteOnPressed;
  bool? friendList;

  UserCards(
      {this.user,
      this.addOnPressed,
      this.visitOnPressed,
      this.deleteOnPressed,
      this.friendList});

  @override
  Widget build(BuildContext context) {
    var postStore = Provider.of<PostStore>(context);
    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        title: Text(user!.fullName!),
        leading: Container(
          child: Image.network(user!.profilePhoto!),
        ),
        trailing: !friendList!
            ? IconButton(
                icon: Icon(Icons.info_outline),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 100,
                                    width: 100,
                                    child: Image.network(user!.profilePhoto!),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(user!.fullName!),
                                      Text(user!.birthDate!.split("T")[0]),
                                    ],
                                  )
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                child: AppButton(
                                  onPressed: addOnPressed,
                                  text: "Arkadaş Ekle",
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                child: AppButton(
                                  onPressed: friendList == true
                                      ? () {}
                                      : () {
                                          postStore
                                              .getUserDetails(user!.id!)
                                              .then((user) => {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                UserScreen(
                                                                    user:
                                                                        user)))
                                                  });
                                        },
                                  text: "Profili Ziyaret Et",
                                ),
                              ),
                            ],
                          ),
                        )),
                    enableDrag: false,
                  );
                },
              )
            : IconButton(
                icon: Icon(Icons.delete),
                onPressed: deleteOnPressed,
              ),
      ),
    );
  }
}
