import 'package:flutter/material.dart';
import 'package:todosaif/components/theme.dart';
import 'package:todosaif/utils/sizedbox.dart';

SafeArea drawer(_advancedDrawerController) {
  return SafeArea(
    child: Container(
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
                decoration: BoxDecoration(
                  color: Colors.black26,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/flutter_logo.png',
                ),
              ),
              Text(
                "Saif",
                style: TextStyle(
                    fontFamily: 'Halenoir',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              verticalBox(20),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.home_outlined,
                  color: colorAccent,
                ),
                title: Text(
                  'Home',
                  style: navTextStyle,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.category_outlined, color: colorAccent),
                title: Text('Categories', style: navTextStyle),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.analytics_outlined, color: colorAccent),
                title: Text('Analytics', style: navTextStyle),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(Icons.settings_outlined, color: colorAccent),
                title: Text('Settings', style: navTextStyle),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
