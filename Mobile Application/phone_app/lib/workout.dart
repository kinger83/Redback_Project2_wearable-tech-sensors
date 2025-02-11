import 'package:flutter/material.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  int _currentIndex = 0;
  String elapsedTime = "00:00:00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: const Color(0xFF8F9E91),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(height: 40),
                const Text(
                  "Workout",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: WorkoutMetricBox(
                            label: "Speed",
                            value: "15 KM/Hr",
                          ),
                        ),
                        Expanded(
                          child: WorkoutMetricBox(
                            label: "Cadence",
                            value: "60 RPM",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // Second Row
                      children: [
                        Expanded(
                          child: WorkoutMetricBox(
                            label: "Distance",
                            value: "3.8 KM",
                          ),
                        ),
                        Expanded(
                          child: WorkoutMetricBox(
                            label: "Oxygen",
                            value: "96%",
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // Third Row
                      children: [
                        Expanded(
                          child: WorkoutMetricBox(
                            label: "Heart Rate",
                            value: "140 BPM",
                          ),
                        ),
                        Expanded(
                          child: WorkoutMetricBox(
                            label: "Temperature",
                            value: "36.7°C",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Time Elapsed",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  elapsedTime,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          width: 300,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Text(
                              "FINISH",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Activities',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class WorkoutMetricBox extends StatelessWidget {
  final String label;
  final String value;

  const WorkoutMetricBox({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    label,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    value,
                    style: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
