import 'package:get/get.dart';
import 'package:msf/data/RecentActivity.dart';

class RecentActivityController extends GetxController {

  var recentActivities = <Recentactivity>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecentActivities();
  }

  void fetchRecentActivities() async {

    await Future.delayed(Duration(seconds: 2));

    //Todo : make the default data grabbed from Server
    var fetchedData = [
      Recentactivity(id: 1, app: 'https://www.who_made_it.com', cr: 10, w: 20, n: 30, e: 40, r: 50),
      Recentactivity(id: 2, app: 'https://www.i_said_it.com', cr: 60, w: 70, n: 80, e: 90, r: 100)
    ];

    recentActivities.assignAll(fetchedData);
  }

  void addActivity(Recentactivity activity) {
    recentActivities.add(activity);
  }

  void removeActivity(int id) {
    recentActivities.removeWhere((activity) => activity.id == id);
  }

  void updateActivity(int id, Recentactivity updatedActivity) {
    int index = recentActivities.indexWhere((activity) => activity.id == id);
    if (index != -1) {
      recentActivities[index] = updatedActivity;
    }
  }
}
