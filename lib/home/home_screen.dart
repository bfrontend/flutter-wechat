import 'package:flutter/material.dart';
import 'package:flutter_wechat/constants.dart';
import '../constants.dart' show Constants;

import './conversation_page.dart';
import './contacts_page.dart';
import './discover_page.dart';

enum ActionItems {
  GROUP_CHAT,
  ADD_FRIEND,
  QR_SCAN,
  PAYMENT,
  HELP
}

class NavigationIconView {
  final BottomNavigationBarItem item;

  NavigationIconView({Key key, String title, IconData icon, IconData activeIcon}) :
    item = new BottomNavigationBarItem(
      icon: Icon(icon),
      activeIcon: Icon(activeIcon),
      title: Text(title),
      backgroundColor: Colors.white
    );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;
  int _currentIndex = 0;
  PageController _pageController;
  List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily
        ),
        activeIcon: IconData(
          0xe603,
          fontFamily: Constants.IconFontFamily
        )
      ),
      NavigationIconView(
          title: '通讯录',
          icon: IconData(
            0xe601,
            fontFamily: Constants.IconFontFamily
          ),
          activeIcon: IconData(
            0xe656,
            fontFamily: Constants.IconFontFamily
          )
      ),
      NavigationIconView(
          title: '发现',
          icon: IconData(
            0xe600,
            fontFamily: Constants.IconFontFamily
          ),
          activeIcon: IconData(
            0xe671,
            fontFamily: Constants.IconFontFamily
          )
      ),
      NavigationIconView(
          title: '我',
          icon: IconData(
            0xe6c0,
            fontFamily: Constants.IconFontFamily
          ),
          activeIcon: IconData(
            0xe626,
            fontFamily: Constants.IconFontFamily
          )
      )
    ];
    _pageController = PageController(initialPage: _currentIndex);
    _pages = [
      ConversationPage(),
      ContactsPage(),
      DiscoverPage(),
      Container(child: Text('我'))
    ];
  }

  _buildPopupMenuItem(int iconName, String title) {
    return Row(
      children: <Widget>[
        Icon(
          IconData(
            iconName,
            fontFamily: Constants.IconFontFamily
          ),
          color: const Color(AppColors.AppBarPopupMenuTextColor),
        ),
        Container(width: 12.0,),
        Text(
          title,
          style: TextStyle(
            color: const Color(AppColors.AppBarPopupMenuTextColor)
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      selectedFontSize: 12.0,
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        setState(() {
          _currentIndex = index;
//          _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 200), curve: Curves.bounceIn);
          _pageController.jumpToPage(_currentIndex);
        });
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              IconData(
                0xe65e,
                fontFamily: Constants.IconFontFamily
              ),
              size: 22.0,
            ),
            onPressed: () { print('点击了搜索'); },
          ),
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe69e, '发起群聊'),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe638, '添加朋友'),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe61b, '扫一扫'),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe62a, '收付款'),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMenuItem(0xe63d, '意见反馈'),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(
              IconData(
                  0xe60e,
                  fontFamily: Constants.IconFontFamily
              ),
              size: 22.0,
            ),
            onSelected: (ActionItems selected) {
              print('点击的是$selected');
            },
          )
        ],
      ),
      body: PageView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _pages[index];
        },
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        itemCount: _pages.length,
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
