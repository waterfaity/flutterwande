import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wande/pages/HomePageEva.dart';
import 'package:wande/pages/HomePageRank.dart';
import 'package:wande/pages/HomePageUser.dart';
import 'package:wande/res/AppColors.dart';

/**
 * 主页
 */
class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  /**
   * 当前页
   */
  var currentPage = 0;

  /**
   * 页面
   */
  var homePages = [HomePageEva(), HomePageRank(), HomePageUser()];

  /**
   * pageView 控制
   */
  var pageControl = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color_bg,
      body: Column(
        children: <Widget>[
          SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).padding.top,
              child: Container(
                color: AppColors.color_primary,
              )),
          Expanded(
            child: PageView(
              controller: pageControl,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: homePages,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (index) {
            pageControl.jumpToPage(index);
          },
          items: getNavigationItems()),
    );
  }

  getNavigationItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon_home_eva.png"),
          activeIcon: Image.asset("assets/images/icon_home_eva_checked.png"),
          backgroundColor: Colors.white,
          title: Text('评价')),
      BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon_home_rank.png"),
          activeIcon: Image.asset("assets/images/icon_home_rank_checked.png"),
          backgroundColor: Colors.white,
          title: Text('榜单')),
      BottomNavigationBarItem(
          icon: Image.asset("assets/images/icon_home_user.png"),
          activeIcon: Image.asset("assets/images/icon_home_user_checked.png"),
          backgroundColor: Colors.white,
          title: Text('我的'))
    ];
  }
}
