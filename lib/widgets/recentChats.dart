import 'package:chat/model/massegeModel.dart';
import 'package:chat/pages/chatPage.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          color: Colors.white,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              final chat = chats[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ChatPage(chat.sender)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: chat.unread ? Color(0xffffefee) : Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  margin: EdgeInsets.only(top: 7, bottom: 5, right: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(chat.sender.imageUrl),
                        radius: 35,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chat.sender.name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                fontSize: 15),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.6,
                            child: Text(
                              chat.text,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            chat.time, style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 14),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          chat.unread ? Container(
                            height: 20,
                            width: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: Colors.red,
                                borderRadius: BorderRadius.circular(30)),
                            child: Text(
                              'NEW', style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 13),
                            ),
                          ) : Text('')
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: chats.length,
          ),
        ));
  }
}
