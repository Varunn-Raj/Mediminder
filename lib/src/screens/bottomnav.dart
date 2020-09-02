import 'package:flutter/material.dart';

import 'package:flutter_icons/flutter_icons.dart';
import 'package:medicine_reminder/src/Reminder_ui/reminddermed.dart';
import 'package:medicine_reminder/src/screens/screen2.dart';

import '../constants.dart';
import '../pages/calendar_page.dart';

import '../pages/home_page.dart';
import '../pages/profile_page.dart';

class MyBottomBarNavigator extends StatefulWidget {
  @override
  _MyBottomBarNavigatorState createState() => _MyBottomBarNavigatorState();
}

class _MyBottomBarNavigatorState extends State<MyBottomBarNavigator> {
  int _selectedIndex = 0;

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // https://www.youtube.com/watch?v=qj7jcuU2Z10 watch this link 3:39 to see what happens
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[_selectedIndex].currentState.maybePop();
        // print(
        //     'isFirstRouteInCurrentTab: ' + isFirstRouteInCurrentTab.toString());
        if (isFirstRouteInCurrentTab) {
          if (_selectedIndex != 0) {
            setState(() {
              _selectedIndex = 0;
            });
            return false;
          }
        }
        // // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
        // if (_selectedIndex == 0) {
        //   return true;
        // } //what this does is ,if at the present state the user is at
        //profile page then while hitting the back button the user wil
        //be directed to the home page
        // setState(() {
        //   _selectedIndex = 0;
        // });
        // return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Feather.home,
                color: kGoodLightGray,
              ),
              title: Text(
                'HOME',
                style: TextStyle(color: kGoodBlack),
              ),
              activeIcon: Icon(
                Feather.home,
                color: kGoodBlack,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesome.calendar_plus_o,
                color: kGoodLightGray,
              ),
              title: Text(
                'TOKEN',
                style: TextStyle(color: kGoodBlack),
              ),
              activeIcon: Icon(
                FontAwesome.calendar_plus_o,
                color: kGoodBlack,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.alarm,
                color: kGoodLightGray,
              ),
              title: Text(
                'REMINDER',
                style: TextStyle(color: kGoodBlack),
              ),
              activeIcon: Icon(
                Icons.alarm,
                color: kGoodBlack,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: kGoodLightGray,
                size: 36,
              ),
              title: Text(
                'PROFILE',
                style: TextStyle(color: kGoodBlack),
              ),
              activeIcon: Icon(
                EvilIcons.user,
                color: kGoodBlack,
                size: 36,
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
        body: Stack(
          children: [
            buildOffstageNavigator(0),
            buildOffstageNavigator(1),
            buildOffstageNavigator(2),
            buildOffstageNavigator(3),
          ],
        ),
      ),
    );
  }

  void next() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomePage(),
          CalendarPage(
            onNext: next,
          ),
          MedicineReminder(),
          ProfilePage(),
        ].elementAt(index);
      },
    };
  }

  Widget buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
