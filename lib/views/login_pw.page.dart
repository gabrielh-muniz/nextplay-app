// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LoginPagePw extends StatelessWidget {
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
                            "Qual a sua senha?",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 16),
                          PasswordFormField(),
                          SizedBox(height: 16),
                          Container(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              child: Text(
                                "Esqueceu a senha?",
                                style: TextStyle(
                                  color: Color(0xff6247AA),
                                ),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                          padding: EdgeInsets.all(20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 16),
                                                child: Text(
                                                  "Selecione uma opcao!",
                                                  style: TextStyle(
                                                    fontSize: 24,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "Voce pode recuperar a senha por e-mail ou pelo numero do seu celular",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              SizedBox(height: 30),
                                              ForgotPasswordGesture(
                                                showcaseIcon:
                                                    Icons.mail_outline_rounded,
                                                title: "E-mail",
                                                subtitle: "Recupere via e-mail",
                                                onTap: () {},
                                              ),
                                              SizedBox(height: 20),
                                              ForgotPasswordGesture(
                                                showcaseIcon: Icons
                                                    .mobile_friendly_rounded,
                                                title: "Telefone",
                                                subtitle:
                                                    "Recupere via numero de celular",
                                                onTap: () {},
                                              ),
                                            ],
                                          ),
                                        ));
                              },
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
                            // Handle login
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: Color(0xff6247AA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Text(
                            "Entrar",
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

class ForgotPasswordGesture extends StatelessWidget {
  const ForgotPasswordGesture({
    required this.showcaseIcon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final IconData showcaseIcon;
  final String title, subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple.shade50,
        ),
        child: Row(
          children: [
            Icon(showcaseIcon, size: 60.0),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(subtitle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({super.key});

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscurePassword,
      autofocus: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Senha',
        labelText: "Senha",
        suffixIcon: IconButton(
          onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          icon: Icon(
            _obscurePassword ? Icons.visibility : Icons.visibility_off,
            color: Color(0xff6247AA),
          ),
        ),
      ),
    );
  }
}
