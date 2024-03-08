import 'package:flutter/material.dart';
//import 'main.dart';
//import 'homePage.dart';
import 'timer.dart';

class MyActivity extends StatefulWidget {
  const MyActivity({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyActivity> createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color(0xFF8F9E91),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 70),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Activity Type",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 100),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 320,
                        child: ElevatedButton(
                          onPressed: () {
                            TimerPageSingleton().updateTitle("Walking");
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         TimerPageSingleton().timerPageInstance,
                            //   ),
                            // );

                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    TimerPageSingleton().timerPageInstance));
                          },
                          child: const Text("Walking",
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 320,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerPage(
                                  title: 'Running',
                                ),
                              ),
                            );
                          },
                          child: const Text("Running",
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Yoga button
                      SizedBox(
                        width: 320,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerPage(
                                  title: 'Yoga',
                                ),
                              ),
                            );
                          },
                          child: const Text("Yoga",
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Sports button
                      SizedBox(
                        width: 320,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerPage(
                                  title: 'Sports',
                                ),
                              ),
                            );
                          },
                          child: const Text("Sports",
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Aerobic button
                      SizedBox(
                        width: 320,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerPage(
                                  title: 'Aerobic',
                                ),
                              ),
                            );
                          },
                          child: const Text("Aerobic",
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Jumba button
                      SizedBox(
                        width: 320,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TimerPage(
                                  title: 'Jumba',
                                ),
                              ),
                            );
                          },
                          child: const Text("Jumba",
                              style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //       switch (_currentIndex) {
      //         case 0:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => HomePage(title: "HomePage"),
      //             ),
      //           );
      //           break;
      //         case 1:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => MyActivity(title: "MyActivity"),
      //             ),
      //           );
      //           break;
      //         case 2:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Setting(title: "MyHomePage"),
      //             ),
      //           );
      //           break;
      //       }
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.accessibility),
      //       label: 'Activities',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }
}
