import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/screens/settings/settings.dart';
import 'package:todosaif/utils/sizedbox.dart';
import 'package:url_launcher/url_launcher.dart';

SafeArea drawer(_advancedDrawerController, user, context) {
  return SafeArea(
    child: ListTileTheme(
      textColor: Colors.white,
      iconColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                heroTag: 'topRightCloseButtonDrawer',
                onPressed: () {
                  // Add your onPressed code here!
                  _advancedDrawerController.hideDrawer();
                },
                backgroundColor: drawerBackground,
                elevation: 0,
                foregroundColor: colorAccent,
                shape: const StadiumBorder(
                    side: BorderSide(
                  color: Colors.white24,
                  width: 2.5,
                )),
                child: const Icon(Icons.arrow_back_ios_new),
              ),
            ),
            Container(
              width: 100.0,
              height: 100.0,
              margin: const EdgeInsets.only(
                top: 24.0,
                bottom: 64.0,
              ),
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: Colors.black26,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  user[0],
                  style: const TextStyle(
                      fontFamily: 'Halenoir',
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            Text(
              user,
              style: const TextStyle(
                  fontFamily: 'Halenoir',
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            verticalBox(20),
            ListTile(
              onTap: () {
                _advancedDrawerController.hideDrawer();
              },
              leading: const Icon(
                Icons.home_outlined,
                color: colorAccent,
              ),
              title: const Text(
                'Home',
                style: navTextStyle,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Settings(user: user)));
              },
              leading: const Icon(Icons.settings_outlined, color: colorAccent),
              title: const Text('Settings', style: navTextStyle),
            ),
            // ListTile(
            //   onTap: () {},
            //   leading: const Icon(Icons.category_outlined, color: colorAccent),
            //   title: const Text('Categories', style: navTextStyle),
            // ),
            // ListTile(
            //   onTap: () {},
            //   leading: const Icon(Icons.analytics_outlined, color: colorAccent),
            //   title: const Text('Analytics', style: navTextStyle),
            // ),

            const Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white54,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'developed by ',
                      style: CusTextStyle(Colors.white, 12, FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () async {
                        //print("Launching @be.saif insta");
                        const String url = 'https://www.instagram.com/be.saif/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Text('be.Saif',
                          style:
                              CusTextStyle(Colors.white, 15, FontWeight.w700)),
                    ),
                  ],
                )),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
