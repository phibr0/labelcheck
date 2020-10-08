import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:labelcheck/functions.dart';
import 'package:labelcheck/wikipediaIntegration.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet(this.result);

  final List result;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.all(16),
                icon: Icon(Icons.help_center),
                onPressed: () => Navigator.pop(context),
              ),
              Container(
                height: 6,
                width: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).disabledColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(3),
                  ),
                ),
                margin: EdgeInsets.all(5),
              ),
              IconButton(
                padding: EdgeInsets.all(16),
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Text(result.toString()),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () => io.File(result.toString()).readAsBytes().then(
                      (value) => launchURL(
                          //Doesnt work anymore because the path isnt passed anymore (Just the result)
                          'mailto:bronzel.phillip@gmail.com?subject=Labelcheck Error&body=Please send only if image actually has a label in it, do not delete the following base64 encoded image: ${base64Encode(value)}'),
                    ),
                child: Container(
                  child: Text('Report Error'),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).errorColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await openWiki(await searchWiki(result
                      .toString()
                      .replaceAll('label: ', '')
                      .replaceAll('}]', '')
                      .trim()
                      .split(',')
                      .elementAt(2)));
                },
                child: Container(
                  child: Text('More information'),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
