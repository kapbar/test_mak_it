import 'package:flutter/material.dart';
import 'package:test_mak_it/api/api.dart';
import 'package:test_mak_it/dto/users.dart';
import 'package:test_mak_it/ui/user_data_screen.dart';

class MainScreenViewModel extends ChangeNotifier {
  final _api = Api();
  List<Users> users = [];
  String? errorMessage;
  bool isLoading = false;
  MainScreenViewModel() {
    loadData();
  }

  Future<void> loadData() async {
    final resultRepoUsers = await _api.getUsers();
    if (resultRepoUsers.errorMessage == null) {
      users = resultRepoUsers.usersList ?? [];
      isLoading = true;
      notifyListeners();
    } else {
      isLoading = true;
      errorMessage = resultRepoUsers.errorMessage;
      notifyListeners();
    }
  }

  void reset() {
    isLoading = false;
    notifyListeners();
    loadData();
  }

  void moveToScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UserDataScreen(user: users[index]),
      ),
    );
  }
}
