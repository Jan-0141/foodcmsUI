import 'package:flutter/material.dart';
import 'package:foodcmsui/core/theme/app_colors.dart';
import 'package:foodcmsui/widgets/app_header.dart';
import 'package:provider/provider.dart';

import '../../../core/router/app_routes.dart';
import '../../../core/theme/app_theme.dart';
import '../../../widgets/app_button.dart';
import '../../../widgets/app_text_field.dart';
import '../../../widgets/pattern_background.dart';
import '../state/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      appBar: AppHeader(title: 'Food CMS',),//AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: PatternBackground(
          opacity: 0.1,
          scale: 5.0,
          angleDegrees: 0,
          assetPath: 'assets/images/backgruod.png',child:  Padding(
            padding: const EdgeInsets.all(180),
            child: Container(
              decoration : BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(300),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).shadowColor.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
              Text('Login', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w900),),
              const SizedBox(height: 30),
              AppTextField(
                width: 300,
                alignment: Alignment.center,
              controller: userController, 
              label: 'Username',),
              const SizedBox(height: 16),
              AppTextField(
                width: 300,
                alignment: Alignment.center,
                controller: passController,
                obscureText: true, label: 'Password',
              ),
              const SizedBox(height: 16),
              if (auth.isLoading) const CircularProgressIndicator(),
              if (auth.errorMessage != null)
                Text(auth.errorMessage!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 8),
              AppButton(
                width: 300,
                onPressed: auth.isLoading
                    ? null
                    : () async {
                        await auth.login(
                          userController.text,
                          passController.text,
                        );
                        if (auth.isLoggedIn && mounted) {
                          Navigator.pushReplacementNamed(context, AppRoutes.home);
                        }
                      },
                label: 'Login',
              ),
                      ],
                      ),
            ),
          )
     ,),
     /*
        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Login', style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w900),),
          const SizedBox(height: 16),
          AppTextField(
            width: 300,
            alignment: Alignment.center,
          controller: userController, 
          label: 'Username',),
          const SizedBox(height: 16),
          AppTextField(
            width: 300,
            alignment: Alignment.center,
            controller: passController,
            obscureText: true, label: 'Password',
          ),
          const SizedBox(height: 16),
          if (auth.isLoading) const CircularProgressIndicator(),
          if (auth.errorMessage != null)
            Text(auth.errorMessage!, style: const TextStyle(color: Colors.red)),
          const SizedBox(height: 8),
          AppButton(
            width: 300,
            onPressed: auth.isLoading
                ? null
                : () async {
                    await auth.login(
                      userController.text,
                      passController.text,
                    );
                    if (auth.isLoggedIn && mounted) {
                      Navigator.pushReplacementNamed(context, AppRoutes.home);
                    }
                  },
            label: 'Login',
          ),
        ],
                  )
     */
      ),
    );
  }
}
