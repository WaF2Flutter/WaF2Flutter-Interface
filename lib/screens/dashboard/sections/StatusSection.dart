import 'package:flutter/material.dart';
import 'package:msf/main.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:msf/screens/dashboard/component/CircleChar.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: secondryColor,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Status",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30,
            ),
            //the chart
            CircleChart(),
        //The list of info
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: primaryColor.withOpacity(0.15),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.visibility_outlined,
                      color: Colors.blueAccent),
                  SizedBox(
                    width: 10,
                  ),
                  AutoSizeText(
                    "Visitors: ",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  AutoSizeText(
                    "143000",
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.greenAccent.withOpacity(0.15),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.wifi_protected_setup_rounded,
                      color: Colors.greenAccent),
                  SizedBox(
                    width: 10,
                  ),
                  AutoSizeText(
                    "Last refresh: ",
                    maxLines: 2,
                    style: TextStyle(fontSize: 12),
                  ),
                  AutoSizeText(
                    "2 min ",
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.yellowAccent.withOpacity(0.15),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.supervised_user_circle_outlined,
                      color: Colors.yellowAccent),
                  SizedBox(
                    width: 10,
                  ),
                  AutoSizeText(
                    "Suspected: ",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  AutoSizeText(
                    "4",
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.redAccent.withOpacity(0.15),
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.shield_outlined,
                      color: Colors.redAccent),
                  SizedBox(
                    width: 10,
                  ),
                  AutoSizeText(
                    "Critical: ",
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  AutoSizeText(
                    "1",
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}

