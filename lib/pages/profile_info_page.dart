import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'page.dart';
import 'util/alert.dart';
import 'util/inputs.dart';
import '../constants.dart';
import '../sheet_row.dart';

const TextStyle _textFieldStyle = TextStyle(
  fontSize: 18.0,
);

class ProfileInfoPage extends StatefulWidget {
  @override
  _ProfileInfoPageState createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends PageState<ProfileInfoPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  PreferredSizeWidget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Profile Info'),
      leading: IconButton(
        icon: Icon(
          Icons.exit_to_app,
          color: Colors.white,
        ),
        onPressed: () {
          alert(
            context: context,
            title: 'Are you sure you want to sign out?',
            message: 'If you sign out, any information not saved will be lost.',
            actions: <Widget>[
              AlertButton(
                'Cancel',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              AlertButton(
                'Sign Out',
                textColor: Colors.red.shade700,
                onPressed: () {
                  sheetRow = SheetRow();
                  googleSignIn.disconnect();
                },
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 15.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            FormPadding(
              child: TextFormField(
                cursorColor: primaryColor,
                style: _textFieldStyle,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'First name',
                ),
                onChanged: (val) {
                  sheetRow.firstName = val;
                },
              ),
            ),
            FormPadding(
              child: TextFormField(
                cursorColor: primaryColor,
                style: _textFieldStyle,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Last name',
                ),
                onChanged: (val) {
                  sheetRow.lastName = val;
                },
              ),
            ),
            FormPadding(
              child: TextFormField(
                cursorColor: primaryColor,
                keyboardType: TextInputType.emailAddress,
                style: _textFieldStyle,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                onChanged: (val) {
                  sheetRow.email = val;
                },
              ),
            ),
            FormPadding(
              child: TextFormField(
                cursorColor: primaryColor,
                style: _textFieldStyle,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                onChanged: (val) {
                  sheetRow.phoneNum = val;
                },
              ),
            ),
            FormPadding(
              child: TextFormField(
                cursorColor: primaryColor,
                style: _textFieldStyle,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                  labelText: 'Address',
                ),
                onChanged: (val) {
                  sheetRow.address = val;
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FormPadding(
                  flex: 4,
                  child: TextFormField(
                    cursorColor: primaryColor,
                    style: _textFieldStyle,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      labelText: 'City',
                    ),
                    onChanged: (val) {
                      sheetRow.city = val;
                    },
                  ),
                ),
                FormPadding(
                  flex: 2,
                  child: TextFormField(
                    cursorColor: primaryColor,
                    style: _textFieldStyle,
                    decoration: InputDecoration(
                      labelText: 'State',
                    ),
                    maxLength: 2,
                    onChanged: (val) {
                      sheetRow.state = val;
                    },
                  ),
                ),
                FormPadding(
                  flex: 3,
                  child: TextFormField(
                    cursorColor: primaryColor,
                    style: _textFieldStyle,
                    inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Zip Code',
                    ),
                    maxLength: 5,
                    onChanged: (val) {
                      sheetRow.zip = val;
                    },
                  ),
                ),
              ],
            ),
            SubmitButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.pushNamed(context, '/membership');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FormPadding extends StatelessWidget {
  final int flex;
  final Widget child;

  FormPadding({this.flex, @required this.child});

  @override
  Widget build(BuildContext context) {
    Padding padding = Padding(
      padding: EdgeInsets.all(20.0),
      child: child,
    );

    return flex == null ? padding : Expanded(
      flex: flex,
      child: padding,
    );
  }
}
