import 'package:get/get.dart';
import 'package:msf/data/RecentActivity.dart';
import 'package:msf/data/data.dart';

class DataController extends GetxController{
  List<CloudInfo> _cloudInfo = demoInfo;
  List<Recentactivity> _recentActivity = demoRecentActivity;

  List<CloudInfo> get cloudInfo => _cloudInfo;
  List<Recentactivity> get recentActivity => _recentActivity;

  // Method to update the data
  void updateData(List<CloudInfo> newCloudInfo, List<Recentactivity> newRecentActivity) {
    _cloudInfo.clear();
    _cloudInfo.addAll(newCloudInfo);

    _recentActivity.clear();
    _recentActivity.addAll(newRecentActivity);
  }
}