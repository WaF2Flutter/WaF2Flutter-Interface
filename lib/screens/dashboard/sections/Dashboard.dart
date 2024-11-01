import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msf/screens/component/EndSection.dart';
import 'package:msf/screens/dashboard/component/AttacksPerApplicationTable.dart';
import 'package:msf/screens/dashboard/component/InfoCardGridView.dart';
import 'package:msf/screens/dashboard/component/ViewersChart.dart';
import 'package:msf/screens/dashboard/sections/StatusSection.dart';
import 'package:msf/data/RecentActivity.dart';
import 'package:msf/utills/responsive.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Dashboard".tr,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Responsive(
                    mobile: InfoCardGridView(
                      crossAxisCount: _size.width < 650 ? 2 : 4,
                      childAspectRatio: _size.width < 650 ? 1.3 : 1,
                    ),
                    tablet: InfoCardGridView(),
                    desktop: InfoCardGridView(
                      childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Responsive(
                    mobile: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: AttacksPerApplicationTable(
                        secondryColor: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    tablet: AttacksPerApplicationTable(
                      secondryColor: Theme.of(context).secondaryHeaderColor,
                    ),
                    desktop: AttacksPerApplicationTable(
                      secondryColor: Theme.of(context).secondaryHeaderColor,
                    ),
                  ),
                  if (Responsive.isMobile(context))
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: StatusSection(),
                    ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            if (!Responsive.isMobile(context))
              Expanded(
                flex: 2,
                child: StatusSection(),
              ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Responsive(
          mobile: Viewers(),
          tablet: Viewers(),
          desktop: Viewers(),
        ),
        SizedBox(
          height: 16,
        ),
        Responsive(
          mobile: EndSection(),
          tablet: EndSection(),
          desktop: EndSection(),
        ),
      ],
    );
  }
}
