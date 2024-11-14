import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';
import 'package:get/get.dart';
import 'package:msf/controllers/dashboard/ResourceUsageController.dart';
import 'package:msf/screens/dashboard/component/InfoCard.dart';

class InfoCardGridView extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;

  InfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.2,
  }) : super(key: key);

  final ResourceUsageController dataController = Get.put(ResourceUsageController());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    double cardWidth =
        (size.width - (crossAxisCount - 1) * 16) / crossAxisCount;
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
            title: "CPU Usage".tr,
            color: Theme.of(context).colorScheme.primary,
            numOfFiles: dataController.resourceUsage.value.cpuFiles ?? 0,
            percentage: dataController.resourceUsage.value.cpuUsage ?? 0,
            totalStorage: dataController.resourceUsage.value.cpuUsage ?? "0%",
          )),
        ),
        SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Obx(() => InfoCards(
            icon: OctIcons.cloud_24,
            title: "Cloud Usage".tr,
            color: Theme.of(context).colorScheme.secondary,
            numOfFiles: dataController.resourceUsage.value.cloudFiles ?? 0,
            percentage: dataController.resourceUsage.value.cloudUsage ?? 0,
            totalStorage: dataController.resourceUsage.value.cloudStorage ?? "0 MB",
          )),
        ),
        SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Obx(() => InfoCards(
            icon: Icons.memory_rounded,
            title: "Memory Usage".tr,
            color: Theme.of(context).colorScheme.tertiary,
            numOfFiles: dataController.resourceUsage.value.memoryFiles ?? 0,
            percentage: dataController.resourceUsage.value.memoryUsage ?? 0,
            totalStorage: dataController.resourceUsage.value.memoryStorage ?? "0 GB",
          )),
        ),
        SizedBox(
          width: cardWidth,
          height: cardHeight,
          child: Obx(() => InfoCards(
            icon: Icons.traffic_outlined,
            title: "Traffic Usage".tr,
            color: Theme.of(context).colorScheme.surface,
            numOfFiles: dataController.resourceUsage.value.trafficFiles ?? 0,
            percentage: dataController.resourceUsage.value.trafficUsage ?? 0,
            totalStorage: dataController.resourceUsage.value.trafficStorage ?? "0 GB",
          )),
        ),
      ],
    );
  }
}