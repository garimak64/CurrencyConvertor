import 'package:currencyconvertor/route/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
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
    return Scaffold(
        backgroundColor: Colors.indigo,
        body: Column(
          children: <Widget>[
            Spacer(flex: 2,),
            Center(
              child: Text("SIVISOFT",
                  style: GoogleFonts.mcLaren(
                      textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ))),
            ),
            Spacer(flex: 1,),
            Text("CURRENCY CONVERTER",
                style: GoogleFonts.mcLaren(
                    textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ))),
            Spacer(flex: 4,),
            Padding(
              padding: const EdgeInsets.only(left:40.0,right: 40.0),
              child: FlatButton(
                  onPressed: () {
                    onGoogleSignIn(context);
                  },
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image(image: AssetImage("assets/images/google_logo.png"), height: 25.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          isUserSignedIn ? 'Signed in' : 'Sign in',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                          ),
                        ),
                      )
                    ],
                  ),),
            ),
            Spacer(flex: 8,),
          ],
        ));
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
