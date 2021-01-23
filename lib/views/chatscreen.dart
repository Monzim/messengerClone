import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:msg_clone/helperFunctions/sharedpre_helper.dart';
import 'package:msg_clone/services/database.dart';
import 'package:random_string/random_string.dart';

class ChatScreen extends StatefulWidget {
  final String chatWithUserName, name;
  ChatScreen(this.chatWithUserName, this.name);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Stream messageStream;
  String chatRoomId, messageId = "";
  String myName, myProfilePic, myUserName, myEmail;
  TextEditingController messageTextEditingController = TextEditingController();

  getMyInfoFromSharedPreferences() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getProfileUrl();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();

    chatRoomId = getChatRoomIdByUserName(widget.chatWithUserName, myUserName);
  }

  getChatRoomIdByUserName(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  addMessage(bool sentClicked) {
    if (messageTextEditingController.text != "") {
      String message = messageTextEditingController.text;

      var lastMessageTs = DateTime.now();
      Map<String, dynamic> messageInfoMap = {
        "message": message,
        "sendBy": myUserName,
        "ts": lastMessageTs,
        "imgUrl": myProfilePic
      };

      //messgerId
      if (messageId == "") {
        messageId = randomAlphaNumeric(12);
      }

      DatabaseMethods()
          .addMessage(chatRoomId, messageId, messageInfoMap)
          .then((value) {
        Map<String, dynamic> lastMessageInfoMap = {
          "lastMessage": message,
          "lastSendTs": lastMessageTs,
          "lastMessageSendBy": myUserName
        };

        DatabaseMethods().updateLastMessageSend(chatRoomId, lastMessageInfoMap);

        if (sentClicked) {
          //remove the message of TextFiled
          messageTextEditingController.text = "";

          //make message id blank to get regenerated on next message send
          messageId = "";
        }
      });
    }
  }

  Widget chatMessageTitle(String message, bool sendByMe) {
    return Row(
      mainAxisAlignment:
          sendByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              bottomRight: sendByMe ? Radius.circular(0) : Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: sendByMe ? Radius.circular(24) : Radius.circular(0),
            ),
            color: Colors.blue,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget chatMessages() {
    return StreamBuilder(
        stream: messageStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.only(bottom: 70, top: 16),
                  itemCount: snapshot.data.docs.length,
                  reverse: true,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return chatMessageTitle(
                        ds["message"], myUserName == ds["sendBy"]);
                  })
              : Center(child: CircularProgressIndicator());
        });
  }

  getAndSetMessages() async {
    messageStream = await DatabaseMethods().getChatRoomMessages(chatRoomId);
    setState(() {});
  }

  doThisOnLaunch() async {
    await getMyInfoFromSharedPreferences();
    getAndSetMessages();
  }

  @override
  void initState() {
    doThisOnLaunch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),

      // message BOX
      body: Container(
        child: Stack(
          children: [
            chatMessages(),
            Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                color: Colors.amber.withOpacity(0.9),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: messageTextEditingController,
                      onChanged: (value) {
                        addMessage(false);
                      },
                      decoration: InputDecoration(
                        hintText: "type a message",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black.withOpacity(0.5)),
                        border: InputBorder.none,
                      ),
                    )),

                    //send Button
                    GestureDetector(
                        onTap: () {
                          addMessage(true);
                        },
                        child: Icon(Icons.send)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
