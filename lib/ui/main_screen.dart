import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_mak_it/constants/app_assets.dart';
import 'package:test_mak_it/constants/app_colors.dart';
import 'package:test_mak_it/ui/error_screen.dart';
import 'package:test_mak_it/ui/main_screen_view_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenViewModel>();
    final reset = model.reset;
    final error = model.errorMessage;
    final users = model.users;
    final isLoading = model.isLoading;

    if (isLoading == false) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (error != null) return ErrorScreen(onPressed: reset);

    return Scaffold(
      appBar: AppBar(
        elevation: _scrollControllerOffset == 0.0 ? 0.0 : 5.0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: _scrollControllerOffset == 0.0
            ? const Text('')
            : const Text('Пользователи'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (_scrollControllerOffset == 0.0)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Пользователи',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              Expanded(
                child: ListView.builder(
                  itemCount: users.length,
                  controller: _scrollController,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () => model.moveToScreen(context, index),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 15.0,
                          horizontal: 10.0,
                        ),
                        child: Row(
                          children: [
                            Image.asset(AppAssets.userCircle),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  users[index].name,
                                  style: const TextStyle(
                                    fontSize: 21.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  users[index].email,
                                  style: const TextStyle(
                                    color: AppColors.userEmail,
                                  ),
                                ),
                                Text(users[index].company.name),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
