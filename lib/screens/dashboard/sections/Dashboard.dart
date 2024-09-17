import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msf/main.dart';
import 'package:msf/screens/dashboard/component/InfoCard.dart';
import 'package:msf/screens/dashboard/sections/StatusSection.dart';
import 'package:msf/data/data.dart';
import 'package:msf/data/RecentActivity.dart';
import 'package:msf/utills/responsive.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Row(
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
                  //     ElevatedButton(onPressed: (){}, child:       Container(    width: 40,     height: 20,     decoration: BoxDecoration(       color: Colors.blueAccent,      borderRadius: BorderRadius.circular(5)      ),       child: Row(     children: [ Icon(Icons.add_outlined), Text("Add R")    ],    ), ))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Responsive(
                  mobile: InfoCardGridView(
                    crossAxisCount: _size.width < 650 ? 2:4,
                    childAspectRatio: _size.width < 650 ? 1.3 :1,),
                  tablet: InfoCardGridView(),
                  desktop: InfoCardGridView(
                    childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                  )),
              SizedBox(
                height: 16,
              ),
              AttacksPerApplicationTable(
                activities: demoRecentActivity,
                secondryColor: secondryColor,
              ),
              if (Responsive.isMobile(context))
                StatusSection(),
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
    );
  }
}

class InfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  const InfoCardGridView(
      {super.key, this.crossAxisCount = 4, this.childAspectRatio = 4});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: demoInfo.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: childAspectRatio),
      itemBuilder: (context, index) => InfoCards(info: demoInfo[index]),
    );
  }
}

class AttacksPerApplicationTable extends StatelessWidget {
  final List<Recentactivity> activities;
  final Color secondryColor;

  const AttacksPerApplicationTable({
    Key? key,
    required this.activities,
    required this.secondryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: secondryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Attacks per Application",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: double.infinity,
              child: DataTable(
                columnSpacing: 40,
                horizontalMargin: 0,
                columns: [
                  DataColumn(label: Text("#")),
                  DataColumn(label: Text("Application")),
                  DataColumn(label: Text("Critical")),
                  DataColumn(label: Text("Warning")),
                  DataColumn(label: Text("Notice")),
                  DataColumn(label: Text("Errors")),
                  DataColumn(label: Text("Reqiests")),
                ],
                rows: activities.map((activity) {
                  return DataRow(cells: [
                    DataCell(Text(activity.id.toString())),
                    DataCell(Text(Uri.parse(activity.app)
                        .host)), // display the hostname of the URL
                    DataCell(Text(activity.cr.toString())),
                    DataCell(Text(activity.w.toString())),
                    DataCell(Text(activity.n.toString())),
                    DataCell(Text(activity.e.toString())),
                    DataCell(Text(activity.r.toString())),
                  ]);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
