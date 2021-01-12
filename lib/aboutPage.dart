import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:package_info/package_info.dart';
import 'functions.dart';
import 'generated/l10n.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  S.of(context).about,
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              CircleAvatar(
                maxRadius: 90,
                minRadius: 60,
                backgroundImage: NetworkImage(
                  'https://avatars0.githubusercontent.com/u/59741989?s=460&u=1fd337366ce2e275971f29173901837bee035e2e&v=4',
                ),
              ),
              Column(
                children: [
                  Text(
                    S.of(context).hi,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    S.of(context).aboutDescription,
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              Divider(),
              SignInWithGithub(
                onPressed: () =>
                    launchURL('https://github.com/phibr0/labelcheck'),
                title: 'GitHub Repository',
                buttonColor: Theme.of(context).textTheme.bodyText1.color,
                fontColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              SignInWithEmail(
                onPressed: () => launchURL('mailto: bronzel.phillip@gmail.com'),
                title: S.of(context).feedback,
                buttonColor: Theme.of(context).primaryColor,
                fontColor: Theme.of(context).scaffoldBackgroundColor,
              ),
              Divider(),
              OutlinedButton(
                onPressed: () async {
                  PackageInfo packageInfo = await PackageInfo.fromPlatform();
                  showAboutDialog(
                    context: context,
                    applicationIcon: Image.asset(
                      'assets/images/logo.png',
                      width: 50,
                    ),
                    applicationName: packageInfo.appName,
                    applicationVersion: packageInfo.version +
                        ' [Build ${packageInfo.buildNumber}]',
                    applicationLegalese:
                        'App Icon by Simon B.\nLarge parts of the dataset by Carolin L.\nPackage: ${packageInfo.packageName}',
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline_rounded),
                    SizedBox(width: 5),
                    Text(S.of(context).about + ' app')
                  ],
                ),
              ),
              OutlinedButton(
                onPressed: () => launchURL('https://labelcheck.phibr0.de'),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.privacy_tip_rounded),
                    SizedBox(width: 5),
                    Text(S.of(context).privacy.toLowerCase())
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
