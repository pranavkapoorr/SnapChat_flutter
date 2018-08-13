import 'package:flutter/material.dart';
import 'package:snapchat_clone/resources.dart';

class Chats extends StatefulWidget{
  @override
 ChatsState createState() => ChatsState();

}
class ChatsState extends State<Chats>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 5,
          itemBuilder: (context,index)=>_chatMessages()
      ),
    );
  }
  Widget _chatMessages(){
    return new ListTile(
      leading:new CircleAvatar(backgroundImage: NetworkImage("https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png"),),
      title: new Text('Name',style: new TextStyle(fontWeight: FontWeight.w500),),
      subtitle: Padding(
        padding: const EdgeInsets.fromLTRB(13.0,0.0,0.0,0.0),
        child: new Row(
          children: <Widget>[
            flipIcon(new Icon(Icons.chat_bubble_outline,color: Colors.blue,size: 15.0,)),
            new Text("Received . 3d", style: TextStyle(color: Colors.black26,fontWeight:FontWeight.w500),)
          ],
        ),
      ),
    );
  }
}