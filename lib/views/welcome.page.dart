// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FractionallySizedBox(
              heightFactor: 0.5, // Adjust the container height
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Catch message
                    Text(
                      "Realize seu sonho no esporte, \ncomece agora!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    // Two buttons in a row (half screen each)
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for button 1
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xff6247AA),
                              foregroundColor: Color(0xffFFFFFF),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("Entrar"),
                          ),
                        ),
                        SizedBox(width: 10), // Space between buttons
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // Action for button 2
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffE6E4FC),
                              foregroundColor: Color(0xff141216),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text("Registrar"),
                          ),
                        ),
                      ],
                    ),

                    // Separator text
                    Text(
                      "ou continue com",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                    // Social Media Buttons (Google and Facebook)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Action for Google Sign-In
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Border radius for the button
                              side: BorderSide(
                                  color: Color(0xffE6E4FC),
                                  width: 2), // Stroke color and width
                            ),
                            backgroundColor:
                                Colors.transparent, // No background color
                            elevation: 0, // Remove shadow
                            padding: EdgeInsets.zero, // Padding around the icon
                            fixedSize: Size(50, 50),
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 10), // Space between buttons
                        ElevatedButton(
                          onPressed: () {
                            // Action for Google Sign-In
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10), // Border radius for the button
                              side: BorderSide(
                                  color: Color(0xffE6E4FC),
                                  width: 2), // Stroke color and width
                            ),
                            backgroundColor:
                                Colors.transparent, // No background color
                            elevation: 0, // Remove shadow
                            padding: EdgeInsets.zero, // Padding around the icon
                            fixedSize: Size(50, 50),
                          ),
                          child: FaIcon(
                            FontAwesomeIcons.facebook,
                            size: 24,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
