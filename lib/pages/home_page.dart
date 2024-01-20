import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLeftDrawerOpen = false;
  bool isBottomDrawerOpen = false;
  double bottomDrawerHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music App'),
      ),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! < -10) {
            setState(() {
              isBottomDrawerOpen = true;
              bottomDrawerHeight = MediaQuery.of(context).size.height * 0.6;
            });
          } else if (details.primaryDelta! > 10) {
            setState(() {
              isBottomDrawerOpen = false;
              bottomDrawerHeight = 0.0;
            });
          }
        },
        child: const Center(
          child: Text('Main Content'),
        ),
      ),
      // Left Option Menu Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Music App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Search'),
              onTap: () {
                // Handle search tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                // Handle profile tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                // Handle settings tap
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      // Custom Bottom Drawer
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: bottomDrawerHeight,
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              ListTile(
                title: const Text('Bottom Drawer Header'),
                onTap: () {
                  setState(() {
                    isBottomDrawerOpen = !isBottomDrawerOpen;
                    bottomDrawerHeight = isBottomDrawerOpen
                        ? MediaQuery.of(context).size.height * 0.6
                        : 0.0;
                  });
                },
              ),
              isBottomDrawerOpen
                  ? ListTile(
                      title: const Text('Bottom Drawer Content'),
                      onTap: () {
                        // Handle bottom drawer item tap
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      // Button for Bottom Drawer
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isBottomDrawerOpen = !isBottomDrawerOpen;
            bottomDrawerHeight = isBottomDrawerOpen
                ? MediaQuery.of(context).size.height * 0.6
                : 0.0;
          });
        },
        child: const Icon(Icons.arrow_upward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
