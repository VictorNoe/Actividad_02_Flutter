import 'package:flutter/material.dart';

class RecoveryAccountScreen extends StatelessWidget {
  const RecoveryAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
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
                  decoration: const InputDecoration(
                    hintText: 'Codigo',
                    label: Text('Correo electrónico'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/validate_code');
                    },
                    child: const Text('Envíar código'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
