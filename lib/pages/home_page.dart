import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLeftDrawerOpen = false;
  bool isBottomDrawerOpen = false;
  double bottomDrawerHeight = 0.0;
  double leftDrawerTranslation = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Music Identifier',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(80.0),
              child: InkResponse(
                onTap: () {
                  // Add your button click logic here
                },
                splashColor: Colors.black.withOpacity(0.3),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    border: Border.all(
                      color: Colors.black,
                      width: 2.0,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'FIND SIMILAR SONGS',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Add your button click logic here
                  print("Circular button with logo clicked!");
                  // Add more code as needed, e.g., navigation or state updates
                },
                child: Container(
                  width: 250.0,
                  height: 250.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromARGB(255, 250, 122, 2),
                    image: DecorationImage(
                      image: AssetImage('lib/assets/Main.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! < -10) {
                  setState(() {
                    isBottomDrawerOpen = true;
                    bottomDrawerHeight =
                        MediaQuery.of(context).size.height * 0.6;
                  });
                } else if (details.primaryDelta! > 10) {
                  setState(() {
                    isBottomDrawerOpen = false;
                    bottomDrawerHeight = 0.0;
                  });
                }
              },
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    leftDrawerTranslation += details.primaryDelta!;
                    if (leftDrawerTranslation >
                        MediaQuery.of(context).size.width * 0.6) {
                      leftDrawerTranslation =
                          MediaQuery.of(context).size.width * 0.6;
                    } else if (leftDrawerTranslation < 0.0) {
                      leftDrawerTranslation = 0.0;
                    }
                  });
                },
                onHorizontalDragEnd: (details) {
                  // You can add additional logic here if needed
                },
                child: const Center(
                  child: Text(''),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        transform: Matrix4.translationValues(leftDrawerTranslation, 0.0, 0.0),
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Music App',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 251, 230, 4),
                        fontSize: 45,
                      ),
                    ),
                    const SizedBox(
                        height: 8), // Add some space between the texts
                    const Text(
                      ' By Windows 9/11',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: const Text('Search'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: const Text('Profile'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: const Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: bottomDrawerHeight,
        child: Container(
          color: Colors.grey[200],
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'LISTEN',
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    fontSize: 32,
                  ),
                ),
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
                      title: Text(
                        "Today's Biggest Hits",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        // Handle bottom drawer item tap
                      },
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
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
