import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:get/get.dart';
import 'package:msf/controllers/DataController.dart';
import 'package:msf/screens/dashboard/component/InfoCard.dart';
import 'package:msf/screens/dashboard/sections/StatusSection.dart';
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
                height: 16,
              ),
              Responsive(
                mobile: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: AttacksPerApplicationTable(
                    activities: demoRecentActivity,
                    secondryColor: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
                tablet: AttacksPerApplicationTable(
                  activities: demoRecentActivity,
                  secondryColor: Theme.of(context).secondaryHeaderColor, 
                ),
                desktop: AttacksPerApplicationTable(
                  activities: demoRecentActivity,
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
    );
  }
}

class InfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  InfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.2,
  }) : super(key: key);

  final DataController dataController = Get.put(DataController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    double cardWidth = (size.width - (crossAxisCount - 1) * 16) / crossAxisCount;
    double cardHeight = cardWidth / childAspectRatio;

    return GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: childAspectRatio,
      ),
      children: [
        SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Obx(() => InfoCards(
            icon: OctIcons.cpu_24,
            title: "CPU Usage",
            color: Theme.of(context).colorScheme.primary,
            numOfFiles: dataController.cpuFiles.value,
            percentage: dataController.cpuUsage.value,
            totalStorage: dataController.cpuStorage.value,
          )),
        ),
        SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Obx(() => InfoCards(
            icon: OctIcons.cloud_24,
            title: "Cloud Usage",
            color: Theme.of(context).colorScheme.secondary,
            numOfFiles: dataController.cloudFiles.value,
            percentage: dataController.cloudUsage.value,
            totalStorage: dataController.cloudStorage.value,
          )),
        ),
        SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Obx(() => InfoCards(
            icon: Icons.memory_rounded,
            title: "Memory Usage",
            color: Theme.of(context).colorScheme.tertiary,
            numOfFiles: dataController.memoryFiles.value,
            percentage: dataController.memoryUsage.value,
            totalStorage: dataController.memoryStorage.value,
          )),
        ),
        SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Obx(() => InfoCards(
            icon: Icons.traffic_outlined,
            title: "Traffic Usage",
            color: Theme.of(context).colorScheme.surface, 
            numOfFiles: dataController.trafficFiles.value,
            percentage: dataController.trafficUsage.value,
            totalStorage: dataController.trafficStorage.value,
          )),
        ),
      ],
    );
  }
}
class AttacksPerApplicationTable extends StatelessWidget {
  final List<Recentactivity> activities;

  const AttacksPerApplicationTable({
    Key? key,
    required this.activities, required Color secondryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSecondary, 
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Attacks per Application",
              style: Theme.of(context).textTheme.bodyMedium,
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
                  DataColumn(label: Text("Requests")),
                ],
                rows: activities.map((activity) {
                  return DataRow(cells: [
                    DataCell(Text(activity.id.toString())),
                    DataCell(Text(Uri.parse(activity.app).host)),
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
