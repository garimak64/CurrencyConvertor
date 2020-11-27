import 'package:currencyconvertor/base_currency_screen.dart';
import 'package:currencyconvertor/router.dart';
import 'package:currencyconvertor/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  LoginPageWidgetState createState() => LoginPageWidgetState();
}

class LoginPageWidgetState extends State<LoginPageWidget> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth;

  bool isUserSignedIn = false;

  @override
  void initState() {
    super.initState();

    initApp();
  }

  void initApp() async {
    FirebaseApp defaultApp = await Firebase.initializeApp();
    _auth = FirebaseAuth.instanceFor(app: defaultApp);
    checkIfUserIsSignedIn();
  }

  void checkIfUserIsSignedIn() async {
    var userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CurrencyConfig>(
      create: (context) => CurrencyConfig(),
      child: Scaffold(
          backgroundColor: Colors.indigo,
          body: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              Text("SIVISOFT",
                  style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("CURRENCY CONVERTER",
                    style: GoogleFonts.mcLaren(
                        textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ))),
              ),
              Container(
                  padding: EdgeInsets.all(55),
                  child: Align(
                      alignment: Alignment.center,
                      child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          onPressed: () {
                            onGoogleSignIn(context);
                          },
                          color: isUserSignedIn ? Colors.white : Colors.white,
                          child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Icon(Icons.account_circle,
                                          color: Colors.blue)),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Text(
                                        isUserSignedIn
                                            ? 'You\'re logged in with Google'
                                            : 'Sign in',
                                        style: TextStyle(color: Colors.black)),
                                  )
                                ],
                              ))))),
            ],
          )),
    );
  }

  Future<User> _handleSignIn() async {
    User user;
    bool userSignedIn = await _googleSignIn.isSignedIn();

    setState(() {
      isUserSignedIn = userSignedIn;
    });

    if (isUserSignedIn) {
      user = _auth.currentUser;
    } else {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      user = (await _auth.signInWithCredential(credential)).user;
      userSignedIn = await _googleSignIn.isSignedIn();
      setState(() {
        isUserSignedIn = userSignedIn;
      });
    }

    return user;
  }

  void onGoogleSignIn(BuildContext context) async {
    await _handleSignIn();
    var userSignedIn = await Navigator.pushNamed(
      context,
      Router.baseCurrencyRoute,
    );

    setState(() {
      isUserSignedIn = userSignedIn == null ? true : false;
    });
  }
}
