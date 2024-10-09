import 'package:flutter/material.dart';
import 'package:flutter_actividad_1/config/helpers/validate.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _isObscure1 = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/logo.png',
                    height: 200,
                    width: 200,
                  ),
                  TextFormField(
                    validator: validateEmail,
                    decoration: const InputDecoration(
                      hintText: 'Correo electrónico',
                      label: Text('Correo Electrónico'),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: validatePasswordVoid,
                    obscureText: _isObscure1,
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      label: const Text('Contraseña'),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _isObscure1 = !_isObscure1;
                            });
                          },
                          icon: Icon(_isObscure1
                              ? Icons.visibility
                              : Icons.visibility_off)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text('Iniciar sesión'),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, '/recovery_account');
                      },
                      child: const Text(
                        'Recuperar contraseña',
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
