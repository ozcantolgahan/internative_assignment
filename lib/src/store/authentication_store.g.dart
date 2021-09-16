// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticationStore on _AuthenticationStore, Store {
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isEmpty => (_$isEmptyComputed ??= Computed<bool>(() => super.isEmpty,
          name: '_AuthenticationStore.isEmpty'))
      .value;
  Computed<bool>? _$applyValidComputed;

  @override
  bool get applyValid =>
      (_$applyValidComputed ??= Computed<bool>(() => super.applyValid,
              name: '_AuthenticationStore.applyValid'))
          .value;

  final _$emailAtom = Atom(name: '_AuthenticationStore.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$userAtom = Atom(name: '_AuthenticationStore.user');

  @override
  UserModel? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$showPasswordAtom = Atom(name: '_AuthenticationStore.showPassword');

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  final _$errorTextAtom = Atom(name: '_AuthenticationStore.errorText');

  @override
  String get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  final _$errorPasswordTextAtom =
      Atom(name: '_AuthenticationStore.errorPasswordText');

  @override
  String get errorPasswordText {
    _$errorPasswordTextAtom.reportRead();
    return super.errorPasswordText;
  }

  @override
  set errorPasswordText(String value) {
    _$errorPasswordTextAtom.reportWrite(value, super.errorPasswordText, () {
      super.errorPasswordText = value;
    });
  }

  final _$passwordAtom = Atom(name: '_AuthenticationStore.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AuthenticationStore.isLoading');

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

  final _$loginAsyncAction = AsyncAction('_AuthenticationStore.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$getUserAsyncAction = AsyncAction('_AuthenticationStore.getUser');

  @override
  Future getUser() {
    return _$getUserAsyncAction.run(() => super.getUser());
  }

  final _$_AuthenticationStoreActionController =
      ActionController(name: '_AuthenticationStore');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.changeEmail');
    try {
      return super.changeEmail(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.changePassword');
    try {
      return super.changePassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePassword() {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.togglePassword');
    try {
      return super.togglePassword();
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validateEmail() {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.validateEmail');
    try {
      return super.validateEmail();
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic validatePassword() {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction(
        name: '_AuthenticationStore.validatePassword');
    try {
      return super.validatePassword();
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
user: ${user},
showPassword: ${showPassword},
errorText: ${errorText},
errorPasswordText: ${errorPasswordText},
password: ${password},
isLoading: ${isLoading},
isEmpty: ${isEmpty},
applyValid: ${applyValid}
    ''';
  }
}
