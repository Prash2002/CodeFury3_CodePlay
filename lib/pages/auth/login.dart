import 'package:CodeFury3/models/user.dart';
import 'package:CodeFury3/pages/auth/createAcc.dart';
import 'package:CodeFury3/pages/home/home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../artists_list.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final usersRef = Firestore.instance.collection('users');

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
 
 Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
    
        final AuthResult authResult = await _auth.signInWithCredential(credential);
        final FirebaseUser user = authResult.user;
        final CollectionReference userRef = Firestore.instance.collection('users');
        User userEntered = User(id: user.uid, name: user.displayName, email: user.email, photoUrl: user.photoUrl);
        final DocumentSnapshot doc= await userRef.document(user.uid).get();
        if(!doc.exists){
          User us = await Navigator.push(context, MaterialPageRoute(builder: (context) => CreateAcc(user: userEntered)));
          return us;
        }
        return userEntered;
    
      }
    
      @override
      Widget build(BuildContext context) {
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        var orientation = MediaQuery.of(context).orientation;
        return Scaffold(
          body : Container(
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: orientation==Orientation.portrait? AssetImage("assets/images/splash.jpg"):AssetImage("assets/images/splash-hor.jpg"),
              //     fit:BoxFit.cover,
              //   ),
              // ),
              child:Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    "https://image.freepik.com/free-vector/isometric-young-sitting-boy-using-technological-devices-background_23-2148125783.jpg"
                  ),
                  SizedBox(
                    height: 20.0
                  ),
                    GestureDetector(
                      child: Container(
                        // width:orientation==Orientation.portrait? width*0.75:width*0.4,
                        // height:orientation==Orientation.portrait? height*0.28:height*0.55,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20) 
                        ),
                        
                            child: Text("Google Sign In",style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                // fontFamily: 'Acme',
                                color: Color(0xffF15D4F)
                             
                          ),
                        ),
                      ),
                      onTap: ()async {
                          User user = await signInWithGoogle();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ArtistsList(currentUser: user)));
                          },
                    ),
                  
                ],
              ),
            ),
          // ),
        );
      }
    }