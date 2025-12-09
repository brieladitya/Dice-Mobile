import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  
  final List<Widget> _screens = [
    HomeContent(),
    ProfileContent(),
    SettingsContent(),
    AboutContent(),
  ];

  final List<String> _titles = ['Home', 'Profile', 'Settings', 'About'];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            // Drawer Header with user info
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.blue.shade700],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Text('JD'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'johndoe@example.com',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            // Main navigation items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    selected: _selectedIndex == 0,
                    onTap: () => _onItemTapped(0),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Profile'),
                    selected: _selectedIndex == 1,
                    onTap: () => _onItemTapped(1),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    selected: _selectedIndex == 2,
                    onTap: () => _onItemTapped(2),
                  ),
                  ListTile(
                    leading: Icon(Icons.info),
                    title: Text('About'),
                    selected: _selectedIndex == 3,
                    onTap: () => _onItemTapped(3),
                  ),
                ],
              ),
            ),
            
            // Footer section
            Divider(),
            Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Icon(Icons.power_settings_new, size: 18),
                  SizedBox(width: 8),
                  Text('Log Out'),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          _screens[_selectedIndex], // Main content
          
          // Center bottom Row
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        print('Button 1 pressed');
                      },
                      child: Icon(Icons.home),
                      backgroundColor: Colors.blue,
                      mini: true,
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      onPressed: () => _scaffoldKey.currentState?.openDrawer(),
                      child: Icon(Icons.menu),
                      backgroundColor: Colors.green,
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      onPressed: () {
                        print('Button 3 pressed');
                      },
                      child: Icon(Icons.settings),
                      backgroundColor: Colors.orange,
                      mini: true,
                    ),
                    SizedBox(width: 10),
                    FloatingActionButton(
                      onPressed: () {
                        print('Button 4 pressed');
                      },
                      child: Icon(Icons.settings),
                      backgroundColor: const Color.fromARGB(255, 228, 58, 200),
                      mini: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Content widgets for each screen
class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 64, color: Colors.blue),
          SizedBox(height: 16),
          Text(
            'Home Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Welcome to the home screen!',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: Colors.green),
          SizedBox(height: 16),
          Text(
            'Profile Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Your profile information',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class SettingsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.orange),
          SizedBox(height: 16),
          Text(
            'Settings Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Configure your app settings',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info, size: 64, color: Colors.purple),
          SizedBox(height: 16),
          Text(
            'About Screen',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Text(
            'Learn more about this app',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}