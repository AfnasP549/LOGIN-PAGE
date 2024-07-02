import 'package:flutter/material.dart';
import 'package:my_login_project/List.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  var uname = "user";
  var pwd = "123";

  bool _isUsernameValid = true;
  bool _isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Login Screen'),
        backgroundColor: Colors.green[300],
      ),
      body: Form(
        key: _formkey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Username field
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _usernameController,
                  focusNode: _usernameFocusNode,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorText: !_isUsernameValid ? 'Invalid username' : null,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(
                        color: _isUsernameValid ? Colors.green : Colors.red,
                      ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                ),
                // Password field
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _passwordController,
                    focusNode: _passwordFocusNode,
                    // ***
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      errorText: !_isPasswordValid ? 'Invalid password' : null,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(
                          color: _isPasswordValid ? Colors.green : Colors.red,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                ),
                // Login Button
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState?.validate() ?? false) {
                      if (_usernameController.text == uname && _passwordController.text == pwd) {
                        setLogin();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) {
                            return List();
                          },
                        ));
                      } else {
                        setState(() {
                          _isUsernameValid = _usernameController.text == uname;
                          _isPasswordValid = _passwordController.text == pwd;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Invalid username or password'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> setLogin() async {
    final shr = await SharedPreferences.getInstance();
    return shr.setBool('login', true);
  }
}
