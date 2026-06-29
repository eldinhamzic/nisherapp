import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/theme/app_theme.dart';
import 'features/auth/presentation/login_screen.dart';

void main() {
  runApp(const ProviderScope(child: NicherApp()));
}

class NicherApp extends StatelessWidget {
  const NicherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nicher',
      theme: AppTheme.light(),
      home: const LoginScreen(),
    );
  }
}
