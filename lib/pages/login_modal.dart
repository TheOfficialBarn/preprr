import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prepr_app/classes/navigation.dart';
import 'package:prepr_app/services/auth_service.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  //Below is for memory management and to avoid memory leaks
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool upOrIn = true;
  bool isLoggedIn = false; //If this is true, a profile modal will appear. If false, the login modal will appear.


  @override
  Widget build(BuildContext context) {
    return upOrIn ? signUpContainer(context) : signInContainer(context);
  }


  //FrationallySizedBox can be a valid replacement if this were to ever break.
  //This is the SIGN UP CONTAINER
  Container signUpContainer(context) {
    return Container(
      height: 510,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Hello There!',
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextField(
            controller: firstNameController,
            decoration: const InputDecoration(
              labelText: 'First Name',
            ),
          ),
          TextField(
            controller: lastNameController,
            decoration: const InputDecoration(
              labelText: 'Last Name',
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          Padding(padding: const EdgeInsets.all(10), 
          child: ElevatedButton(
            onPressed: () async {
              User? user = await AuthService().signupWithEmail(emailController.text, passwordController.text, firstNameController.text, lastNameController.text); //This line is to sign up the user with their email and password. It also gives the user a display name.
              if (user != null) { //I think this line is to check if the user is not null, then it will push the user to the NavigationMenu page.
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationMenu()));
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => ThemeData().colorScheme.inverseSurface),
              foregroundColor: MaterialStateProperty.resolveWith((states) => ThemeData().colorScheme.background),
              ),
            child: const Text('Sign Up'),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Already have an account?'),
              TextButton(
                onPressed: () {
                  setState(() {
                    upOrIn = false;
                  });
                },
                child: const Text('Sign In'),
              ),
            ],
          ),
          Row( //In case more social media logins are added, this will allow for more buttons to be added in a row
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval( //This clips the clicking area into a circle
                child: Material( //This makes the clicking area a material so that way the clicking area can have a round splash effect
                  child: InkWell(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset('assets/GoogleIcon.png', height: 30, width: 30,)
                    ),
                  ),
                ),
              ),
            ]
          )
        ],
      ),
    );
  }

  //This is the SIGN IN CONTAINER
  //The indent allows for setState to be used in the onPressed function. It has to be included within the class in order for it to work.
  Container signInContainer(context) {
    return Container(
      height: 510,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextField(
            controller: emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'Password',
            ),
          ),
          Padding(padding: const EdgeInsets.all(10), 
          child: ElevatedButton(
            onPressed: () async {
              User? user = await AuthService().signinWithEmail(emailController.text, passwordController.text);
              if (user != null) {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const NavigationMenu()));
              }
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith((states) => ThemeData().colorScheme.inverseSurface),
              foregroundColor: MaterialStateProperty.resolveWith((states) => ThemeData().colorScheme.background),
              ),
            child: const Text('Sign In'),
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                onPressed: () {
                  setState(() {
                    upOrIn = true;
                  });
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
          Row( //In case more social media logins are added, this will allow for more buttons to be added in a row
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval( //This clips the clicking area into a circle
                child: Material( //This makes the clicking area a material so that way the clicking area can have a round splash effect
                  child: InkWell(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Image.asset('assets/GoogleIcon.png', height: 30, width: 30,)
                    ),
                  ),
                ),
              ),
            ]
          )
        ],
      )
    );
  }
}