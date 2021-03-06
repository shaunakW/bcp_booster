import 'package:flutter/material.dart';
import 'page.dart';
import 'search_page.dart';
import 'profile_info_page.dart';
import '../constants.dart';
import '../util/alert.dart';
import '../util/buttons.dart';
import '../util/text.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends PageState<StartPage> {
  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Home'),
      leading: IconButton(
        icon: Icon(Icons.exit_to_app),
        onPressed: () {
          alert(
            context: context,
            title: 'Are you sure you want to sign out?',
            actions: <Widget>[
              AlertButton('Cancel'),
              AlertButton(
                'Sign Out',
                textColor: Colors.red.shade700,
                onPressed: googleSignIn.disconnect,
              ),
            ],
          );
        },
      ),
      actions: [icon],
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50.0),
      child: Center(
        child: ListView(
          children: <Widget>[
            TitleText('Bellarmine Booster Club Signups'),
            PrimaryButton(
              text: 'Add New Member',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ProfileInfoPage(),
                    settings: RouteSettings(name: '/profile'),
                  ),
                );
              },
            ),
            PrimaryButton(
              text: 'Find Member',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SearchPage(),
                    settings: RouteSettings(name: '/search'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
