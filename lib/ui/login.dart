import 'package:flutter/material.dart';
import 'package:flutter_statemanagement/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (BuildContext context) => AuthProvider(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('Login Page'),
            ),
            body: Consumer<AuthProvider>(builder:
                (BuildContext context, AuthProvider value, Widget? child) {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 40,
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      controller: value.email,
                      decoration: InputDecoration(
                        hintText: "Email",
                        labelText: "Email",
                      ),
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: value.password,
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                      ),
                    ),
                    SizedBox(height: 16),
                    MaterialButton(
                      child: Text("Login"),
                      color: Colors.red,
                      onPressed: () {
                        if(value.loadingLogin) return;
                        value.login(context);
                      },
                    ),
                  ],
                ),
              );
            })));
  }
}
