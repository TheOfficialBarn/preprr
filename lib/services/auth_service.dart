import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class AuthService {


  //This is for Google Sign In
  signInWithGoogle() async {
    //Begin interactive Sign-In process
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    //Obtain Auth details from page
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    //Create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //Sign in with credential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  //This is for email sign up
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signupWithEmail(String email, String password, String first, String last) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      addUserInfo(first, last);
      return credential.user;
    } catch (e) {
      print("Error in signupWithEmail: $e");
      return null;
    }
  }

  //When signing up, this will add the user's first and last name to their profile
  //I'm not really sure about anything below butttttt it doesn't seem like it's doing anything wrong sooooo...
  Future addUserInfo(String firstName, String lastName) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.updateDisplayName("$firstName $lastName");
        print("User display name: ${user.displayName}");
      }
    } catch (e) {
      print("Error in addUserInfo: $e");
    }
  }


  //This is for email sign in
  Future<User?> signinWithEmail(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error in signinWithEmail: $e");
      return null;
    }
  }



}