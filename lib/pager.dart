import 'package:flutter/material.dart';

class Pager extends StatelessWidget {
  final PageController controller;
  final Widget leftWidget;
  final Widget rightWidget;

  Pager({this.controller, this.leftWidget, this.rightWidget});

  Iterable<Widget> buildPages() {
    final List<Widget> pages = <Widget>[];

    pages.add(_contentWidget(Colors.white, leftWidget));
    pages.add(_contentWidget(Colors.white));
    pages.add(_contentWidget(Colors.white, rightWidget));
    return pages;
  }

  _contentWidget(Color color, [Widget page]) {
    var widgets = <Widget>[];
    if (page != null) {
      widgets.add(new Positioned.fill(
        child: DefaultTabController(
          length: 3,
          child: Container(
            child: ListView(
              children: <Widget>[
                page==leftWidget?Padding(
                  padding: const EdgeInsets.fromLTRB(66.0,30.0,66.0,0.0),
                  child: TabBar(
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white,
                    indicatorColor: Colors.white,
                    tabs: <Widget>[
                      Tab(child: Text("Add",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),)),
                      Tab(child: Text("Groups",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),)),
                      Tab(child: Text("Chat",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w700),))

                    ],
                  ),
                ):Text(""),
                ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    new Container(
                      margin: new EdgeInsets.fromLTRB(0.0, page==leftWidget?1.0:35.0, 0.0, 0.0),
                      child: page,
                      decoration: new ShapeDecoration(
                          color: Colors.white,
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.only(
                                  topLeft: new Radius.circular(10.0),
                                  topRight: new Radius.circular(10.0)
                              )
                          )
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
    }else{
      widgets.add(Padding(
        padding: const EdgeInsets.fromLTRB(0.0,65.0,0.0,0.0),
        child: Divider(color: Colors.white,),
      ));
    }

    return new Stack(
      children: widgets,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Positioned.fill(
        child: new Directionality(
          textDirection: TextDirection.ltr,
          child: new PageView(
            controller: controller,
            children: buildPages(),
          ),
        )
    );
  }
}