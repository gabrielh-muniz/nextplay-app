// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPageEmail extends StatelessWidget {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Back navigation
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Text field and paragraph
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Qual o seu e-mail?",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 16),
                          TextField(
                            controller: _controller,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: true,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: _controller.clear,
                                icon: Icon(Icons.clear),
                              ),
                              labelText: "E-mail",
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              border: OutlineInputBorder(),
                              hintText: 'Enter your email',
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Full-width button at the bottom
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/login-pw');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Color(0xff6247AA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Text(
                            "Continuar",
                            style: TextStyle(fontSize: 19, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
