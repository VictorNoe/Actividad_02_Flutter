import 'package:flutter_actividad_1/presentation/screens/screens.dart';

final appRouter =  {
  '/': (context) => const SplashScreen(),
  '/login': (context) => const LoginScreen(),
  '/recovery_account': (context) => const RecoveryAccountScreen(),
  '/validate_code' : (context) => const ValidateCodeScreen(),
  '/change_password' : (context) => const ChangePasswordScreen(),
};