import 'package:flutter/material.dart';


class StoryTiles extends StatefulWidget{
  @override
  StoryTilesState createState() => StoryTilesState();

}
class StoryTilesState extends State<StoryTiles> {
  @override
  Widget build(BuildContext context) {
    return _tiles();
  }
  Widget _tiles(){
    return Column(

      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Friends",style: TextStyle(color: Colors.purple, fontSize: 17.0,fontWeight: FontWeight.w700),),
                  ],
                ),
                Container(
                  height: 130.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: ((context,index) => _makeTile(120.0,90.0,"https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png","friend-$index")),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Subscriptions",style: TextStyle(color: Colors.purple, fontSize: 17.0,fontWeight: FontWeight.w700),),
                  ],
                ),
          Container(
            height: 140.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: ((context,index) => _makeTile(140.0,100.0,"https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png","Subscription")),
            ),
          ),
          ]
        ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("For You",style: TextStyle(color: Colors.purple, fontSize: 17.0,fontWeight: FontWeight.w700),),
                  ],
                ),
                _newsTiles(20)
              ],
            ),
          ),
        ),
      ],
    );
  }
  Widget _newsTiles(int totalTiles){
    List<Widget> tiles = new List();
    for(int i = 1; i < totalTiles; i++){
      if(i%2==0){
        tiles.add(Row(
          children: <Widget>[
            _makeTile(280.0, 160.0, "https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png","X-Men"),
          ],
        ));
      }else{
        tiles.add(Row(
          children: <Widget>[
            _makeTile(380.0, 200.0, "https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png","X-Men"),
          ],
        ));
      }
    }
    return Container(
        //height: totalTiles*(160.0+50.0)/2,
        child: Column(
          children: tiles
        )   //  _makeTile(260.0, 100.0, "https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png"))),
    );
  }
  Widget _makeTile(double height,double width, String link,String name){
    return Container(
      height: height,
      width: width,
      color: Colors.white10,
      child: Card(
        elevation: 1.9,
        child: Stack(
         children: <Widget>[
           Image.network(link),
           Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.end,
               children: <Widget>[
                 CircleAvatar(backgroundImage: NetworkImage(link),radius: 15.0,),
                 Text(name,style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black26),),
               ],
             ),
           )
         ],
        ) ),
    );
  }
}