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
    return Container(
      child: Column(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Friends",style: TextStyle(color: Colors.purple, fontSize: 18.0,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Container(
                    height: 130.0,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: ((context,index) => _makeTile(120.0,90.0,"https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png")),
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
                      Text("Subscriptions",style: TextStyle(color: Colors.purple, fontSize: 18.0,fontWeight: FontWeight.w500),),
                    ],
                  ),
            Container(
              height: 140.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: ((context,index) => _makeTile(140.0,90.0,"https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png")),
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
                      Text("For You",style: TextStyle(color: Colors.purple, fontSize: 18.0,fontWeight: FontWeight.w500),),
                    ],
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                        itemCount: 5,
                        itemBuilder: ((context,index)=>_makeTile(160.0, 100.0, "https://d2x5ku95bkycr3.cloudfront.net/App_Themes/Common/images/profile/0_200.png"))),
                  )
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
  Widget _makeTile(double height,double width, String link){
    return Container(
      height: height,
      width: width,
      color: Colors.white10,
      child: Card(
        elevation: 1.9,
        child: Image.network(link),
      ),
    );
  }
}