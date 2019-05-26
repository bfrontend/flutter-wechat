import 'dart:async';
import 'package:flutter/material.dart';
//import '../../utils/shared_preferences.dart';


import 'package:flutter_wechat/components/page_reveal/index.dart';
import 'package:flutter_wechat/components/page_dragger/index.dart';
import 'package:flutter_wechat/components/page_indicator/index.dart';
import 'package:flutter_wechat/components/pages/index.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with TickerProviderStateMixin {

  StreamController<SlideUpdate> slideUpdateStream;
  AnimatedPageDragger animatedPageDragger;

  int activeIndex = 0;
  int nextPageIndex = 0;
  SlideDirection slideDirection = SlideDirection.none;
  double slidePercent = 0.0;


  _WelcomePageState() {
    slideUpdateStream = StreamController<SlideUpdate>();
    
    slideUpdateStream.stream.listen((SlideUpdate event){
      setState(() {
        if (event.updateType == UpdateType.dragging) {
//          print('方向 ${event.direction} at ${event.slidePercent} activeIndex $activeIndex');
          slideDirection = event.direction;
          slidePercent = event.slidePercent;

          if (slideDirection == SlideDirection.leftToRight) {
            nextPageIndex = activeIndex - 1;
          } else if (slideDirection == SlideDirection.rightToLeft) {
            nextPageIndex = activeIndex + 1;
          } else {
            nextPageIndex = activeIndex;
          }
        } else if (event.updateType == UpdateType.doneDragging) {
          if (slidePercent > 0.5) {
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.open,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );
          } else {
            animatedPageDragger = new AnimatedPageDragger(
              slideDirection: slideDirection,
              transitionGoal: TransitionGoal.close,
              slidePercent: slidePercent,
              slideUpdateStream: slideUpdateStream,
              vsync: this,
            );

            nextPageIndex = activeIndex;
          }

          animatedPageDragger.run();
        } else if (event.updateType == UpdateType.animating) {
          slideDirection = event.direction;
          slidePercent = event.slidePercent;
        } else if (event.updateType == UpdateType.doneAnimating) {


          if (activeIndex == pages.length - 1) {
            _goHomePage(context);
          } else {
            activeIndex = nextPageIndex;
          }
          slideDirection = SlideDirection.none;
          slidePercent = 0.0;

          animatedPageDragger.dispose();
        }
      });
    });
  }
  @override
  void dispose() {
    slideUpdateStream.close();
    super.dispose();
  }
  _goHomePage(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }
//  http://imgoss.bfrontend.com/2019-05-26-022400.jpg
//  onPressed: () async {
//  await SpUtil.getInstance()..putBool(SharedPreferencesKeys.showWelcome, false);
//  _goHomePage(context);
//},

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Page(
          viewModel: pages[activeIndex],
          percentVisible: 1.0
        ),
        PageReveal(
          revealPercent: slidePercent,
          child: Page(
            viewModel: pages[nextPageIndex],
            percentVisible: slidePercent,
          ),
        ),
        PageIndicator(
          viewModel: PageIndicatorViewModel(
            pages,
            activeIndex,
            slideDirection,
            slidePercent
          ),
        ),
        PageDragger(
          canDragLeftToRight: activeIndex > 0,
          canDragRightToLeft: activeIndex < pages.length - 1,
          slideUpdateStream: this.slideUpdateStream,
        )
      ],
    );
  }
}

