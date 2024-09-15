import 'package:flutter/material.dart';
import 'package:flutter_octicons/flutter_octicons.dart';



class CloudInfo {
  final IconData icon;
  final String title, totalStorage;
  final int numOfFiles, percentage;
  final Color color;

  CloudInfo({
    required this.icon,
    required this.title,
    required this.totalStorage,
    required this.numOfFiles,
    required this.percentage,
    required this.color,
  });
}

List<CloudInfo> demoInfo = [
  CloudInfo(
    icon:OctIcons.cpu_24,
    title: "Cpu Usage",
    totalStorage: "80%",
    numOfFiles: 8,
    percentage: 75,
    color: Colors.blueAccent,
  ),
  CloudInfo(
    icon: OctIcons.cloud_24,
    title: "Cloud Usage",
    totalStorage: "800 MB",
    numOfFiles: 502,
    percentage: 50,
    color: Colors.yellowAccent,
  ),
  CloudInfo(
    icon:  Icons.memory_rounded,
    title: "Memory Usage",
    totalStorage: "16 GB",
    numOfFiles: 15,
    percentage: 90,
    color: Colors.blueGrey,
  ),
  CloudInfo(
    icon: Icons.traffic_outlined,
    title: "Traffics Usage",
    totalStorage: "1 TB",
    numOfFiles: 600,
    percentage: 60,
    color: Colors.blue,
  ),
];