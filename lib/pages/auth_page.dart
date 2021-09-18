import 'package:flutter/material.dart';
import 'package:sawo/sawo.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './home.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  // sawo object
  Sawo sawo = Sawo(
    apiKey: dotenv.env['API_KEY'].toString(),
    secretKey: dotenv.env['SECRET_KEY'].toString(),
  );

  // user payload
  String user = "";

  void payloadCallback(context, payload) {
    if (payload == null || (payload is String && payload.length == 0)) {
      payload = null;
    }
    setState(() {
      user = payload;

      if (user != null) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => HomePage(),
          ),
        );
      }
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
              Text(
                'Politika',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 36,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'All you need to know about politics, decision making, political leaders in one place. Filtered by region',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 40),
              // Text("UserData :- $user"), //! payload
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
