import 'package:chat_app11/Components/Custome_Text_filed.dart';
import 'package:chat_app11/Components/custome_login_buttone.dart';
import 'package:chat_app11/views/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/widgets.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoding = false;
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoding,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 71, 128),
        body: Form(
          key: formkey,
          child: ListView(
            children: [
              const SizedBox(
                height: 90,
              ),
              Image.asset(
                'assets/images/scholar.png',
                height: 100,
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'scholar chat ',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'sign in ',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              CustomeTextFiled(
                onChanged: (data) {
                  email = data;
                },
                hintText: 'Email',
              ),
              CustomeTextFiled(
                obscure: true,
                onChanged: (data) {
                  password = data;
                },
                hintText: 'Password',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomeLoginButtone(
                onTap: () async {
                  if (formkey.currentState!.validate()) {
                    isLoding = true;
                    setState(() {});
                    try {
                      await loginUser();
                        Navigator.pushNamed(context, ChatPage.id,arguments: email);
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showSnackBar(context, "user not found");
                      } else if (e.code == 'wrong-password') {
                        showSnackBar(context, "wrong password");
                      }
                    } catch (e) {
                      showSnackBar(context, e.toString());
                    }
                    isLoding = false;
                    setState(() {});
                  }
                },
                text: 'sign in',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "don't have an account  ??",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'RegestrPage');
                    },
                    child: const Text(
                      '  register',
                      style: TextStyle(
                        color: Color.fromARGB(222, 132, 237, 253),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
