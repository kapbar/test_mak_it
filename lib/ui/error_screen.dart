import 'package:flutter/material.dart';
import 'package:test_mak_it/constants/app_assets.dart';
import 'package:test_mak_it/widgets/app_button_widget.dart';

class ErrorScreen extends StatelessWidget {
  final void Function()? onPressed;
  const ErrorScreen({
    Key? key,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.warning),
              const SizedBox(height: 35),
              const Text(
                'Не удалось загрузить информацию',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 30),
              AppButtonWidget(
                title: 'Обновить',
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
