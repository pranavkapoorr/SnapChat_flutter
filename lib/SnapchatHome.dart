import 'package:flutter/material.dart';
import 'package:snapchat_clone/camera_page.dart';
import 'package:snapchat_clone/chats.dart';
import 'package:snapchat_clone/circle_button.dart';
import 'package:snapchat_clone/pager.dart';
import 'package:snapchat_clone/shade.dart';
import 'dart:ui';

import 'package:snapchat_clone/story_page.dart';

class Snapchat extends StatefulWidget {
  @override
  _SnapchatState createState() => new _SnapchatState();
}

class _SnapchatState extends State<Snapchat> {
  final PageController pagerController =
  new PageController(keepPage: true, initialPage: 1);

  double buttonDiameter = 100.0;
  double offsetRatio = 0.0;
  double offsetFromOne = 0.0;

  bool onPageView(ScrollNotification notification) {
    if (notification.depth == 0 && notification is ScrollUpdateNotification) {
      setState(() {
        offsetFromOne = 1.0 - pagerController.page;
        offsetRatio = offsetFromOne.abs();
      });
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return new MediaQuery(
        data: new MediaQueryData.fromWindow(window),
        child: new Directionality(
            textDirection: TextDirection.ltr,
            child: new Scaffold(
              body: new Stack(
                children: <Widget>[
                  new CameraHome(),
                  new Shade(
                    opacity: offsetRatio,
                    isLeft: offsetFromOne > 0,
                  ),

                  new NotificationListener<ScrollNotification>(
                      onNotification: onPageView,
                      child: new Pager(
                        controller: pagerController,
                        leftWidget: new Chats(),
                        rightWidget: new StoryTiles(),
                      )
                  ),

                  new ControlsLayer(
                    offset: offsetRatio,
                    onTap: () {
                      playPause();
                    },
                    onCameraTap: () async {
                      await flipCamera();
                      setState(() {});
                    },
                  )
                ],
              ),
            )
        )
    );
  }


}