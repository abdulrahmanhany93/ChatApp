import 'package:chat/model/massegeModel.dart';
import 'package:chat/model/user_model.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final User user;

  ChatPage(this.user);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  _buildMessage(Message message, bool isMe) {
    final msg = Container(
      margin: isMe
          ? EdgeInsets.fromLTRB(80, 12, 0, 8)
          : EdgeInsets.fromLTRB(0, 12, 0, 8),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
          color: isMe ? Color(0xffF4E8D9) : Color(0xffffefee),
          borderRadius: isMe
              ? BorderRadius.only(
                  topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))
              : BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message.time,
            style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
                fontSize: 15),
          ),
          SizedBox(
            height: 8,
          ),
          Text(message.text),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
            icon: Icon(
              message.isLiked ? Icons.favorite : Icons.favorite_border,
              color: message.isLiked ? Colors.red : Colors.blueGrey,
            ),
            onPressed: () {})
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF20E07),
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white,
            ),
            iconSize: 30,
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xffF20E07),
      ),
      body: GestureDetector(
        onTap: ()=>FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50)),
                  child: ListView.builder(
                    reverse: true,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                    itemCount: messages.length,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.image),
                      color: Colors.red,
                      onPressed: () {}),
                  Expanded(
                      child: TextField(
                        onChanged: (value){},
                        textCapitalization: TextCapitalization.sentences,
                    decoration:
                        InputDecoration.collapsed(hintText: 'Send a message',),
                  )),
                  IconButton(
                      icon: Icon(Icons.send),
                      color: Colors.red,
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
