import 'package:flutter/material.dart';
import 'package:sawo/sawo.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // sawo object
  Sawo sawo = Sawo(
    //! dont show api key
    apiKey: "API key",
    secretKey: "Secret key",
  );

  // user payload
  String user = "";

  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = "Login Failed :(";
    }
    setState(() {
      user = payload;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("UserData :- $user"),
              ElevatedButton(
                onPressed: () {
                  sawo.signIn(
                    context: context,
                    identifierType: 'email',
                    callback: payloadCallback,
                  );
                },
                child: Text('Email Login'),
              ),
              ElevatedButton(
                onPressed: () {
                  sawo.signIn(
                    context: context,
                    identifierType: 'phone_number_sms',
                    callback: payloadCallback,
                  );
                },
                child: Text('Phone Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
