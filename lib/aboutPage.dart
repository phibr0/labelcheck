import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
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
              LineButton(
                title: S.of(context).donate,
                onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(S.of(context).donate),
                      actions: [
                        FlatButton(
                          child: Text(S.of(context).copyWallet),
                          onPressed: () => Clipboard.setData(
                            ClipboardData(
                                text:
                                    '45MeC6HdkJBgnL66faHjyPjkUFtGwkiYyXvukpU9YKa1aFMXzt2FsQa1mVLQiEFVtZiNuyV2eZY3uj6ft8Ur8JQZ9ewNde7'),
                          ).whenComplete(
                            () => Navigator.pop(context),
                          ),
                        ),
                        FlatButton(
                          child: Text(S.of(context).close),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                      content: Text(S.of(context).donateInfo),
                    );
                  },
                ),
                lineColor: Theme.of(context).accentColor,
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
