import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:docbook/Authentication/phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

// void main() => runApp(MyApp());

class Profile extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
        initTheme: kLightTheme,
        child: Builder(builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: kDarkTheme,
            home: ProfileScreen(),
          );
        }));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(414, 896), minTextAdapt: true);
    var profileInfo = Expanded(
      child: Column(
        children: [
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: [
                CircleAvatar(
                  // backgroundColor: Colors.blue,
                  // child: Container(child: Image.asset('assets/images/archit.jpeg')),
                  radius: kSpacingUnit.w * 5,
                  // radius: 200,
                  // foregroundImage: AssetImage('assets/image/f1.jpeg'),
                  backgroundImage: AssetImage('assets/images/archit.jpeg'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit.w * 2.5,
                    width: kSpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        shape: BoxShape.circle),
                    child: Icon(LineAwesomeIcons.camera,
                        color: kDarkPrimaryColor,
                        size: ScreenUtil().setSp(kSpacingUnit.w * 1.5)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: kSpacingUnit.w * 2,
          ),
          Text(
            'Archit Jain',
            style: kTitleTextStyle,
          ),
          SizedBox(
            height: kSpacingUnit.w * 0.5,
          ),
          Text(
            'jarchit416@gmail.com',
            style: kTitleTextStyle,
          ),
          SizedBox(
            height: kSpacingUnit.w * 2,
          ),
          Container(
            height: kSpacingUnit.w * 5,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                'Upgrade to pro',
                style: kButtonTextStyle,
              ),
            ),
          )
        ],
      ),
    );
    var themeSwitcher = ThemeSwitcher(builder: (context) {
      return AnimatedCrossFade(
        duration: Duration(milliseconds: 200),
        crossFadeState: Theme.of(context).brightness == Brightness.dark
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: GestureDetector(
          onTap: () =>
              ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
          child: Icon(
            LineAwesomeIcons.sun,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
        secondChild: GestureDetector(
          onTap: () => ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
          child: Icon(
            LineAwesomeIcons.moon,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
      );
    });
    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: kSpacingUnit.w * 3,
        ),
        Icon(
          LineAwesomeIcons.arrow_left,
          size: ScreenUtil().setSp(kSpacingUnit.w * 3),
        ),
        profileInfo,
        themeSwitcher,
        SizedBox(
          width: kSpacingUnit.w * 3,
        ),
      ],
    );
    return ThemeSwitchingArea(child: Builder(
      builder: (context) {
        return Scaffold(
          body: Column(children: <Widget>[
            SizedBox(
              height: kSpacingUnit.w * 5,
            ),
            header,
            Expanded(
              child: ListView(
                children: <Widget>[
                  profileListItem(
                    icon: Icons.manage_accounts,
                    text: 'Manage Account',
                  ),
                  profileListItem(
                    icon: Icons.chat_bubble_outline_sharp,
                    text: 'Chat',
                  ),
                  profileListItem(
                    icon: Icons.video_call,
                    text: 'Video Call',
                  ),
                  InkWell(
                    onTap: () async{
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isLogin', false);
                      Phoenix.rebirth(context);
                      // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Phone()), (route) => false);
                      // Navigator.pushNamedAndRemoveUntil(context, 'phone', (route) => false);
                    },
                    child: profileListItem(
                      icon: Icons.logout_outlined,
                      text: 'Logout',
                      hasNavigation: false,
                    ),
                  ),
                ],
              ),
            )
          ]),
        );
      },
    ));
  }
}

class profileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;
  const profileListItem({
    Key? key,
    required this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4)
          .copyWith(bottom: kSpacingUnit.w * 2),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
          color: Theme.of(context).backgroundColor),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(
            width: kSpacingUnit.w * 2.5,
          ),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(fontWeight: FontWeight.w500),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit.w * 2.5,
            ),
        ],
      ),
    );
  }
}