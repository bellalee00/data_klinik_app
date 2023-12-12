// ignore_for_file: library_private_types_in_public_api, sized_box_for_whitespace, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, deprecated_member_use

import 'package:data_klinik_app/service/login_service.dart';
import 'package:data_klinik_app/ui/beranda.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login Admin",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 50),
                Center(
                  child: Form(
                    key: _formKey,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: Column(
                        children: [
                          _usernameTextField(),
                          SizedBox(height: 20),
                          _passwordTextField(),
                          SizedBox(height: 40),
                          _tombolLogin(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Username"),
      controller: _usernameCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your username';
        }
        return null;
      },
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Password"),
      obscureText: true,
      controller: _passwordCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  Widget _tombolLogin() {
    return ElevatedButton(
      child: Text("Login"),
      onPressed: () async {
        if (_formKey.currentState?.validate() ?? false) {
          String username = _usernameCtrl.text;
          String password = _passwordCtrl.text;
          bool loginSuccess = await LoginService().login(username, password);

          if (loginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Beranda()),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                content: const Text("Username atau Password Tidak Valid"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  )
                ],
              ),
            );
          }
        }
      },
    );
  }
}
