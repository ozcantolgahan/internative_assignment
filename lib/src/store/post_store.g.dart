// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostStore on _PostStore, Store {
  final _$usersAtom = Atom(name: '_PostStore.users');

  @override
  ObservableList<UserModel> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(ObservableList<UserModel> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_PostStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$friendsAtom = Atom(name: '_PostStore.friends');

  @override
  ObservableList<UserModel> get friends {
    _$friendsAtom.reportRead();
    return super.friends;
  }

  @override
  set friends(ObservableList<UserModel> value) {
    _$friendsAtom.reportWrite(value, super.friends, () {
      super.friends = value;
    });
  }

  final _$getAllUsersAsyncAction = AsyncAction('_PostStore.getAllUsers');

  @override
  Future getAllUsers(String myId) {
    return _$getAllUsersAsyncAction.run(() => super.getAllUsers(myId));
  }

  final _$getUserDetailsAsyncAction = AsyncAction('_PostStore.getUserDetails');

  @override
  Future getUserDetails(String userId) {
    return _$getUserDetailsAsyncAction.run(() => super.getUserDetails(userId));
  }

  final _$getAllFriendsAsyncAction = AsyncAction('_PostStore.getAllFriends');

  @override
  Future getAllFriends() {
    return _$getAllFriendsAsyncAction.run(() => super.getAllFriends());
  }

  final _$addToFriendsAsyncAction = AsyncAction('_PostStore.addToFriends');

  @override
  Future addToFriends(String userId, String myId) {
    return _$addToFriendsAsyncAction
        .run(() => super.addToFriends(userId, myId));
  }

  final _$removeFromFriendsAsyncAction =
      AsyncAction('_PostStore.removeFromFriends');

  @override
  Future removeFromFriends(String userId) {
    return _$removeFromFriendsAsyncAction
        .run(() => super.removeFromFriends(userId));
  }

  @override
  String toString() {
    return '''
users: ${users},
isLoading: ${isLoading},
friends: ${friends}
    ''';
  }
}
