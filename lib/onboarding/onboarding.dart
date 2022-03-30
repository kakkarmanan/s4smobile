import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s4smobile/login1/welcome.dart';
import 'package:s4smobile/form/size_config.dart';
import 'package:lottie/lottie.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentPage = 0;
  List<Map<dynamic, dynamic>> onboardingData = [
    {
      "text1": "WELCOME TO SHRINK4SHRINK",
      "text2": "We are here to solve your problems",
      "image": "assets/img/lottieFiles/71851-doctor-with-mobile.json",
      "height": 322.0
    },
    {
      "text1": "GET ONLINE PSYCHITRIC THERAPY SESSIONS",
      "text2":
          "Get online therapy sessions with in-app video sessions and prescriptions from doctors.",
      "image": "assets/img/lottieFiles/88284-doctor-prescription.json",
      "height": 322.0
    },
    {
      "text1": "FIND THE SUITABLE DOCTOR FOR YOU",
      "text2": "Get the doctor that helps you the most",
      "image": "assets/img/lottieFiles/77192-search-doctor.json",
      "height": 322.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.white),
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    flex: 468,
                    child: PageView.builder(
                      itemCount: onboardingData.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Lottie.asset(
                          onboardingData[currentPage]['image'],
                          height: (onboardingData[currentPage]['height']),
                          width: double.infinity,
                        ),
                      ),
                      onPageChanged: (value) => {
                        setState(() => {
                              currentPage = value,
                            })
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 847 * 379,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50.0),
                          topLeft: Radius.circular(50.0),
                        ),
                        color: Color.fromARGB(255, 13, 90, 65),
                      ),
                      padding: EdgeInsets.all(0),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.only(top: 25.0),
                              alignment: Alignment.topCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  3,
                                  (index) => buildDot(index),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: PageView.builder(
                              itemCount: onboardingData.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  onboardingData[currentPage]["text1"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onPageChanged: (value) => {
                                setState(() => {
                                      currentPage = value,
                                    })
                              },
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: PageView.builder(
                              itemCount: onboardingData.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                  onboardingData[currentPage]["text2"],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onPageChanged: (value) => {
                                setState(() => {
                                      currentPage = value,
                                    })
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding:
                                  const EdgeInsets.only(bottom: 5, right: 12),
                              alignment: Alignment.bottomRight,
                              child: TextButton(
                                child: Text(
                                  currentPage == (onboardingData.length - 1)
                                      ? "NEXT"
                                      : "SKIP",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16),
                                  textAlign: TextAlign.end,
                                ),
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => WelcomePage())),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    flex: 379,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container buildDot(int index) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 30 : 6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
