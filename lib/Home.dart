import 'package:flutter/material.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:s4smobile/previousSessions.dart';
import 'package:s4smobile/Routines.dart';
import 'package:s4smobile/upcoming_sessions.dart';
import 'package:s4smobile/NewSession.dart';
import 'package:s4smobile/dashboard.dart';
import 'package:s4smobile/widgets/drawer.dart';
import 'package:localstorage/localstorage.dart';

class Home extends StatefulWidget {
  final String email;
  Home({required this.email});

  @override
  _HomeState createState() => _HomeState(email: email);
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  var email;
  final LocalStorage storage = new LocalStorage('s4s');
  PageController _pageController = PageController();
  _HomeState({required this.email});
  late int currentIndex;
  Future<void> awaitReady() async {
    await storage.ready;
    print("home print");
    print(storage.getItem('user'));
  }

  @override
  void initState() {
    super.initState();
    awaitReady();
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
      ),
      drawer: drawer(context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NewSession(),
            ),
          );
        },
        child: const Icon(Icons.add),
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
              title: Text("Routine"))
        ],
      ),
      body: PageView(
        children: [
          UserDashboard(),
          UpcomingSessions(),
          PreviousSessions(),
          RoutineUpload(),
        ],
        controller: _pageController,
        onPageChanged: changePage,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
