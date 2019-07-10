import 'package:flutter/material.dart';
import '../blocs/provider.dart';
import '../blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Bloc bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          SizedBox(height: 16),
          submitButton(bloc),
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshop) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: "Email Adderss",
            hintText: "you@example.com",
            errorText: snapshop.error,
          ),
        );
      },
    );
  }

  Widget passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshop) {
        return TextField(
          onChanged: bloc.changePassword,
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Password",
            errorText: snapshop.error,
          ),
          obscureText: true,
        );
      },
    );
  }

  Widget submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValue,
      builder: (context, snapshot) {
        return RaisedButton(
          child: Text("Login"),
          onPressed: snapshot.hasData ? bloc.submit : null,
          color: Colors.deepPurple,
          textColor: Colors.white,
        );
      },
    );
  }
}
