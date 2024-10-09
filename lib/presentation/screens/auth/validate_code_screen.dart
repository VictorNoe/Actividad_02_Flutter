import 'package:flutter/material.dart';

class ValidateCodeScreen extends StatefulWidget {
  const ValidateCodeScreen({super.key});

  @override
  State<ValidateCodeScreen> createState() => _ValidateCodeScreenState();
}

class _ValidateCodeScreenState extends State<ValidateCodeScreen> {
  final TextEditingController input1 = TextEditingController();
  final TextEditingController input2 = TextEditingController();
  final TextEditingController input3 = TextEditingController();
  final TextEditingController input4 = TextEditingController();

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  void verifyCode() {
    String code = input1.text + input2.text + input3.text + input4.text;
    if (code == "1234") {
      print("Código Correcto");
    } else {
      print("Código Incorrecto");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/logo.png',
              height: 200,
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInputField(input1, focusNode1, null, focusNode2),
                _buildInputField(input2, focusNode2, focusNode1, focusNode3),
                _buildInputField(input3, focusNode3, focusNode2, focusNode4),
                _buildInputField(input4, focusNode4, focusNode3, null),
              ],
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
                  Navigator.pushReplacementNamed(context, '/change_password');
                },
                child: const Text('Validar código'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField( 
      TextEditingController controller, 
      FocusNode currentFocus, 
      FocusNode? previousFocus, 
      FocusNode? nextFocus
    ) {
    return SizedBox(
      width: 50,
      child: TextField(
        controller: controller,
        focusNode: currentFocus,
        maxLength: 1,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          counterText: '',
          hintText: '0',
          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (nextFocus != null) {
              FocusScope.of(context).requestFocus(nextFocus);
            } else {
              currentFocus.unfocus();
            }
          } else if (value.isEmpty && previousFocus != null) {
            FocusScope.of(context).requestFocus(previousFocus);
          }
        },
        onSubmitted: (_) {
          if (nextFocus == null) {
            currentFocus.unfocus();
          }
        },
      ),
    );
  }
}
