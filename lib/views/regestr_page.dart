import 'package:chat_app11/Components/Custome_Text_filed.dart';
import 'package:chat_app11/Components/custome_login_buttone.dart';
import 'package:chat_app11/views/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegestrPage extends StatefulWidget {
  RegestrPage({super.key});

  @override
  State<RegestrPage> createState() => _RegestrPageState();
}

class _RegestrPageState extends State<RegestrPage> {
  String? email;

  String? password;

  bool IsLoding = false;

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: IsLoding,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 2, 71, 128),
        body: Form(
          key: formkey,
          child: ListView(children: [
            const SizedBox(height: 90),
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
                  'Register  ',
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
                  IsLoding = true;
                  setState(() {});
                  try {
                    await registerUser();
                    Navigator.pushNamed(context, ChatPage.id);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showSnackBar(context, "too weak password");
                    } else if (e.code == 'email-already-in-use') {
                      showSnackBar(context, "the email is already  used ");
                    }
                  } catch (e) {
                    showSnackBar(context, e.toString());
                  }
                  IsLoding = false;
                  setState(() {});
                }
              },
              text: 'Register',
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
                    Navigator.pop(context);
                  },
                  child: const Text(
                    '  sign in ',
                    style: TextStyle(
                      color: Color.fromARGB(222, 132, 237, 253),
                    ),
                  ),
                ),
              ],
            )
          ]),
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

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
