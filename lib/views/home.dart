import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:msg_clone/helperFunctions/sharedpre_helper.dart';
import 'package:msg_clone/services/auth.dart';
import 'package:msg_clone/services/database.dart';
import 'package:msg_clone/views/chatscreen.dart';
import 'package:msg_clone/views/signin.dart';
import 'package:msg_clone/widget/drawesettingPage.dart';
import 'package:msg_clone/widget/infoPage.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isSearching = false;
  Stream userStream, chatRoomsStream;
  String myName, myProfilePic, myUserName, myEmail;

  TextEditingController searchUserNameEditingController =
      TextEditingController();

  getMyInfoFromSharedPreferences() async {
    myName = await SharedPreferenceHelper().getDisplayName();
    myProfilePic = await SharedPreferenceHelper().getProfileUrl();
    myUserName = await SharedPreferenceHelper().getUserName();
    myEmail = await SharedPreferenceHelper().getUserEmail();
    setState(() {});
  }

  getChatRoomIdByUserName(String a, String b) {
    if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
      return "$b\_$a";
    } else {
      return "$a\_$b";
    }
  }

  onSearchButtonClick() async {
    isSearching = true;
    setState(() {});
    userStream = await DatabaseMethods()
        .getUserByUserName(searchUserNameEditingController.text);
    setState(() {});
  }

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return ChatRoomListTile(ds.id, ds["lastMessage"], myUserName);
                })
            : Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget searchFieldUserTile({String profileUrl, name, username, email}) {
    return GestureDetector(
      onTap: () {
        // print("you fool this is me my name $myUserName and 2nd $username");
        var chatRoomId = getChatRoomIdByUserName(myUserName, username);
        Map<String, dynamic> chatRoomInfoMap = {
          "users": [myUserName, username]
        };

        DatabaseMethods().createChatRoom(chatRoomId, chatRoomInfoMap);

        //before going to charRoom
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatScreen(
                      username,
                      name,
                    )));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              profileUrl,
              height: 40,
              width: 40,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.white),
              ),
              Text(
                email,
                style: TextStyle(color: Colors.white),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget searchUserList() {
    return StreamBuilder(
      stream: userStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.docs.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return searchFieldUserTile(
                    profileUrl: ds["imgUrl"],
                    name: ds["name"],
                    email: ds["email"],
                    username: ds["username"],
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }

  getChatRooms() async {
    chatRoomsStream = await DatabaseMethods().getChatRooms();
    setState(() {});
  }

  onScreenLoaded() async {
    await getMyInfoFromSharedPreferences();
    getChatRooms();
  }

  @override
  void initState() {
    onScreenLoaded();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.short_text,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => settingPage(
                                    context, myName, myProfilePic, myEmail)));
                      }),
                  AppNameTitle(context, 29.0, Colors.white, Colors.white),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image(
                          height: 50.0, image: NetworkImage(myProfilePic))),
                ],
              ),
            ),
          ),
        ),
      ),

      // App Background Color
      backgroundColor: HexColor("#0D0D0D"),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              children: [
                isSearching
                    ? GestureDetector(
                        onTap: () {
                          isSearching = false;
                          searchUserNameEditingController.text = "";
                          setState(() {});
                        },
                        child: Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            )),
                      )
                    : Container(),
                Expanded(
                  // search Title Edit
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        // color: Colors.amber,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.black),
                            controller: searchUserNameEditingController,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "search here",
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (searchUserNameEditingController.text != "") {
                              onSearchButtonClick();
                            }
                          },
                          child: Icon(Icons.search),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            isSearching
                ? Expanded(child: searchUserList())
                : Expanded(child: chatRoomsList()),
          ],
        ),
      ),
    );
  }
}

class ChatRoomListTile extends StatefulWidget {
  final String chatRoomId, lastMessage, myUserName;
  ChatRoomListTile(this.chatRoomId, this.lastMessage, this.myUserName);

  @override
  _ChatRoomListTileState createState() => _ChatRoomListTileState();
}

class _ChatRoomListTileState extends State<ChatRoomListTile> {
  String profilePicUrl = "", name = "", username = "";

  getThisUserInfo() async {
    username =
        widget.chatRoomId.replaceAll(widget.myUserName, "").replaceAll("_", "");
    QuerySnapshot querySnapshot = await DatabaseMethods().getUserInfo(username);
    print("something the data we are getting ${querySnapshot.docs[0].id}");
    name = "${querySnapshot.docs[0]["name"]}";
    profilePicUrl = querySnapshot.docs[0]["imgUrl"];
    setState(() {});
  }

  @override
  void initState() {
    getThisUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //before going to charRoom
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => ChatScreen(
        //         username,
        //         name,
        //       ),
        //     ));

        Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.scale,
              alignment: Alignment.center,
              child: ChatScreen(username, name),
            ));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              profilePicUrl,
              height: 40,
              width: 40,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
              SizedBox(height: 3),

              // Text(
              //   widget.lastMessage,
              //   overflow: TextOverflow.ellipsis,
              //   style: TextStyle(
              //     fontSize: 16,
              //     color: HexColor("#E6F4F7"),
              //     fontWeight: FontWeight.w500,
              //   ),
              // ),
              Container(
                width: 200,
                child: Text(
                  widget.lastMessage,
                  style: TextStyle(
                    fontSize: 16,
                    color: HexColor("#E6F4F7"),
                  ),
                  overflow: TextOverflow.visible,
                  softWrap: false,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
