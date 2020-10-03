import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: MediaQuery.of(context).size.height / 2,
      child: SingleChildScrollView(
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
                  icon: Icon(Icons.help_center),
                  onPressed: () => Navigator.pop(context),
                ),
                Container(
                  height: 6,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Theme.of(context).disabledColor,
                      borderRadius: BorderRadius.all(Radius.circular(3))),
                  margin: EdgeInsets.all(5),
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
