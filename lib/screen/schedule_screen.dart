import 'package:flutter/material.dart';

import '../widgets/upcoming_schedule.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  int _buttonIndex = 0;
  final _scheduleWidgets = [
    //Upcoming Widget
    const UpcomingSchedule(),
    //Completed Widget
    Container(),
    //Cancelled Widget
    Container(),

  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Schedule",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
            ),),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(5),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 0;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      decoration: BoxDecoration(
                        color: _buttonIndex == 0 ? Colors.tealAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Upcoming", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _buttonIndex == 0 ? Colors.black54 : Colors.black38,
                      ),),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 1;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      decoration: BoxDecoration(
                        color: _buttonIndex == 1 ? Colors.tealAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Completed", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _buttonIndex == 1 ? Colors.black54 : Colors.black38,
                      ),),
                    ),
                  ),InkWell(
                    onTap: () {
                      setState(() {
                        _buttonIndex = 2;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 25),
                      decoration: BoxDecoration(
                        color: _buttonIndex == 2 ? Colors.tealAccent : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Cancelled", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: _buttonIndex == 2 ? Colors.black54 : Colors.black38,
                      ),),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            _scheduleWidgets[_buttonIndex.clamp(0, _scheduleWidgets.length - 1)],
          ],
        ),
      ),
    );
  }
}
