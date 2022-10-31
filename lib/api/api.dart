import 'package:dio/dio.dart';
import 'package:test_mak_it/dto/users.dart';

class Api {
  Future<ResultRepoUsers> getUsers() async {
    try {
      final result = await Dio().get(
        'https://jsonplaceholder.typicode.com/users',
      );

      final List usersListJson = result.data ?? [];
      final usersList =
          usersListJson.map((item) => Users.fromJson(item)).toList();
      return ResultRepoUsers(usersList: usersList);
    } catch (error) {
      return ResultRepoUsers(
        errorMessage: 'Что то пошло не так',
      );
    }
  }
}

class ResultRepoUsers {
  ResultRepoUsers({
    this.errorMessage,
    this.usersList,
  });

  final String? errorMessage;
  final List<Users>? usersList;
}
