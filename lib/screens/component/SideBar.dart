import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:msf/controllers/ThemeController.dart';
import 'package:get/get.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            //   DrawerHeader(child: Image.asset("img/Icon.png")),
            const SizedBox(
              height: 80,
            ),
            Divider(
              color: Theme.of(context).dividerColor,
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.speed_outlined,
                color: Colors.white60,
              ),
              title:  AutoSizeText(
                "Dashboard",
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.web,
                color: Colors.white60,
              ),
              title:  AutoSizeText(
                "Websites",
                maxLines: 1,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.settings_sharp,
                color: Colors.white60,
              ),
              title:  AutoSizeText(
                "Settings",
                maxLines: 1,
                 style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.speed_outlined,
                color: Colors.white60,
              ),
              title:  AutoSizeText(
                "Statics",
                maxLines: 1,
                 style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(
                Icons.padding,
                color: Colors.white60,
              ),
              title:  AutoSizeText(
                "System Log",
                maxLines: 1,
                 style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            Row(
              children: [
  Obx(() {
    return Switch(
      value: Get.find<ThemeController>().isDark.value,
      onChanged: (value) {
        Get.find<ThemeController>().toggle();
      },
    );
  }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
