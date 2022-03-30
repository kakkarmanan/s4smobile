import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:s4smobile/Doctor/chat_doc.dart';
import 'package:s4smobile/Doctor/patients.dart';
import 'package:s4smobile/Doctor/pending_sessions.dart';
import 'package:s4smobile/Doctor/previous_sessionsdoc.dart';
import 'package:s4smobile/Doctor/upcoming_sessionsdoc.dart';
import 'package:s4smobile/Doctor/dashboarddoc.dart';
import 'package:s4smobile/widgets/drawer.dart';
import 'package:s4smobile/Doctor/patientlist.dart';
import 'package:localstorage/localstorage.dart';

final LocalStorage storage = LocalStorage('s4s');

class DoctorHome extends StatefulWidget {
  final String email;
  DoctorHome({required this.email});

  @override
  _HomeState createState() => _HomeState(email: email);
}

class _HomeState extends State<DoctorHome> with TickerProviderStateMixin {
  final email;

  Future<void> awaitReady() async {
    await storage.ready;
    //print(storage.getItem('user'));
    // if (storage.getItem('user') != null) {
    //   print(storage.getItem('user'));
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) =>
    //               Home(email: storage.getItem('user')["email"])));
    // }
  }

  PageController _pageController = PageController();
  _HomeState({required this.email});
  late int currentIndex;
  @override
  void initState() {
    awaitReady();
    super.initState();
    print('in doctor home: ${storage.getItem('user')}');
    currentIndex = 0;
  }

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("s4s"),
        backgroundColor: Color.fromARGB(255, 13, 90, 65),
      ),
      drawer: drawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PatientList(),
            ),
          );
        },
        child: const Icon(Icons.featured_play_list_outlined),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        //key: ,

        hasNotch: true,
        fabLocation: BubbleBottomBarFabLocation.end,
        opacity: .2,
        currentIndex: currentIndex,
        onTap: (currentIndex) => {
          _pageController.animateToPage(
            currentIndex!,
            duration: const Duration(milliseconds: 650),
            curve: Curves.ease,
          )
        },
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(16),
        ),
        elevation: 8,
        tilesPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.dashboard, color: Colors.black),
            activeIcon: Icon(Icons.dashboard, color: Colors.red),
            title: Text("Home"),
          ),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(Icons.calendar_today, color: Colors.black),
              activeIcon: Icon(Icons.calendar_today, color: Colors.deepPurple),
              title: Text("Upcoming")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(Icons.history, color: Colors.black),
              activeIcon: Icon(Icons.history, color: Colors.indigo),
              title: Text("Previous")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(Icons.task, color: Colors.black),
              activeIcon: Icon(Icons.task, color: Colors.green),
              title: Text("Patients"))
        ],
      ),
      body: PageView(
        children: [
          DoctorDashboard(),
          UpcomingSessionsDoc(),
          PreviousSessionsDoc(),
          Patients(),
        ],
        controller: _pageController,
        onPageChanged: changePage,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
