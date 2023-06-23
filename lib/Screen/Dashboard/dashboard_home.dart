import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../logic/user_controller.dart';
import '../../styles/color.dart';
import '../widgets/drawer.dart';

//homepage/dashboard
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    addData();
    super.initState();
  }

  void addData() async {
    final usercontroller = Get.find<UserController>();
    await usercontroller.refressUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kKarobarcolor,
      drawer: const DrawerWidget(),
      appBar: AppBar(
        backgroundColor: kKarobarcolor,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kKarobarcolor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: SafeArea(child: LayoutBuilder(builder: (context, constraints) {
        return Container(
            color: Colors.white,
            width: constraints.maxWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: kKarobarcolor,
                  child: const Text("Reminder"),
                )
              ],
            ));
      })),
    );
  }
}
