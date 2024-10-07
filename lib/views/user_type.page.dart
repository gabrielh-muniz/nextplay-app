// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

const List<String> list = <String>['Jogador', 'Clube'];

class UserType extends StatelessWidget {
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
                            "Escolha o tipo de usuario:",
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 16),
                          DropdownUserType(),
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

class DropdownUserType extends StatefulWidget {
  @override
  _DropdownUserTypeState createState() => _DropdownUserTypeState();
}

class _DropdownUserTypeState extends State<DropdownUserType> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the dropdown full-width
      child: DropdownButtonFormField<String>(
        value: selectedValue,
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
        items: <String>['Jogador', 'Clube']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        decoration: InputDecoration(
          border: OutlineInputBorder(), // Add a border around it
          labelText: 'Tipo',
          hintText: 'Escolha uma opcao',
        ),
      ),
    );
  }
}

