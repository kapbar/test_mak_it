import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_mak_it/constants/app_assets.dart';
import 'package:test_mak_it/constants/app_colors.dart';
import 'package:test_mak_it/ui/main_screen.dart';
import 'package:test_mak_it/ui/main_screen_view_model.dart';
import 'package:test_mak_it/widgets/app_button_widget.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Color color = AppColors.primary;

  void Function()? onPressed() {
    setState(() {});
    if (loginController.text.isEmpty || passwordController.text.isEmpty) {
      color = AppColors.primary.withOpacity(0.5);
      return null;
    } else {
      color = AppColors.primary;
      return () {
        FocusScope.of(context).unfocus();
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (_) => MainScreenViewModel(),
                child: const MainScreen()),
          ),
          (route) => false,
        );
      };
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loginController.addListener(onPressed);
    passwordController.addListener(onPressed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Image(
            image: const AssetImage(AppAssets.background),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            fit: BoxFit.cover,
          ),
          const Positioned(
            left: 24,
            top: 135,
            child: Text(
              'Вход',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 48.0,
                    vertical: 60.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 18,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        controller: loginController,
                      ),
                      const SizedBox(height: 40.0),
                      TextFormField(
                        obscureText: true,
                        obscuringCharacter: '\u2B24',
                        style: const TextStyle(letterSpacing: 5.0),
                        decoration: const InputDecoration(
                          labelText: 'Пароль',
                          labelStyle: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 18,
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                        controller: passwordController,
                      ),
                      const SizedBox(height: 80.0),
                      AppButtonWidget(
                        title: 'Войти',
                        onPressed: onPressed(),
                        color: color,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
