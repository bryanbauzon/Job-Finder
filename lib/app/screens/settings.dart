import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Widget settingsWidget(String text, IconData icon) => InkWell(
        onTap: () {},
        child: Card(
          shadowColor: Common().appColor,
          child: Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: Common().appColor),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        text,
                        style: GoogleFonts.lato(
                            color: Common().appColor, fontSize: 16),
                      )
                    ],
                  ),
                  Icon(Icons.chevron_right)
                ],
              ),
            ),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          settingsWidget("Accounts", Icons.account_circle),
          settingsWidget("Apperance", Icons.remove_red_eye),
          settingsWidget("Privacy and Security", Icons.lock),
          settingsWidget("About", Icons.help_outline),
        ],
      ),
    );
  }
}
