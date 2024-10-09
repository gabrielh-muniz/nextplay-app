// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ForgetPasswordEmailPage extends StatelessWidget {
  ForgetPasswordEmailPage({super.key});

  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              SizedBox(height: 16 * 7),
              Column(
                children: [
                  SizedBox(
                      width: 220,
                      height: 220,
                      child: Image(
                        image: AssetImage('assets/pw_recovery.png'),
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 16),
                  Text(
                    "Recuperar senha",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Insira o seu e-mail que eviaremos uma mensagem de recuperacao",
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: _controller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: _controller.clear,
                        icon: Icon(Icons.clear),
                      ),
                      labelText: "E-mail",
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'Enter your email',
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6247AA),
                        foregroundColor: Color(0xffFFFFFF),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Enviar"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
