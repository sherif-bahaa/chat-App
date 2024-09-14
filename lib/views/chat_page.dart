import 'package:chat_app11/chat_buble.dart';
import 'package:chat_app11/models/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  static String id = "ChatPage";
  final _controller = ScrollController(); //to scrol listview to end
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  TextEditingController controller =
      TextEditingController(); //to clear textfiled
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(
              Message.fromJson(snapshot.data!.docs[i]),
            );
          }

          print(snapshot.data!.docs[0]["message"]);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 2, 71, 128),
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/scholar.png",
                    height: 70,
                  ),
                  const Text(
                    "Chat App",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
              centerTitle: true,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        return messagesList[index].id == email
                            ? chatBuble(
                                message: messagesList[index],
                              )
                            : chatBubleForFrind(message: messagesList[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: controller,
                    onSubmitted: (value) {
                      messages.add({
                        "message": value,
                        "createdAt": DateTime.now(),
                        "id": email
                      });
                      controller.clear();
                      _controller.animateTo(0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                    },
                    decoration: InputDecoration(
                        suffix: const Icon(
                          Icons.send,
                          color: Color.fromARGB(255, 2, 71, 128),
                        ),
                        hintText: "send message",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 2, 71, 128),
                            ))),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(body: Text("lowding...."));
        }
      },
    );
  }
}
