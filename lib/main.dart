
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: 'Roboto',
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF042B59)),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF042B59),
            brightness: Brightness.dark,
          ).copyWith(background: const Color(0xFF042B59)),
        ),
        home: const MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('images/my_image.jpg'),
            ),
            const Text(
              'Syahrin Seth',
              style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'FLUTTER DEVELOPER',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                letterSpacing: 2.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
              width: 150.0,
              child: Divider(
                height: 1,
                thickness: 1,
                color: Color(0xFF042B59),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                ),
                title: Text(
                  '+60 12345 6789',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: ListTile(
                leading: Icon(
                  Icons.email
                ),
                title: Text(
                  'syahrinseth@email.com',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 25.0,
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const MyPortfolioScreen(),
                    ),
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.photo_library,
                  ),
                  title: Text(
                    'Portfolio',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}

class MyPortfolioScreen extends StatelessWidget {
  const MyPortfolioScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'),
      ),
      body: Scrollbar(
        child: ListView(
          restorationId: 'list_demo_list_view',
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (var index = 1; index < 21; index++)
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyPortfolioDetailScreen(
                        title: 'Project $index',
                        description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
                      ),
                    ),
                  );
                },
                leading: ExcludeSemantics(
                  child: CircleAvatar(child: Text('$index')),
                ),
                title: Text('Project $index'),
                subtitle: const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
              ),
          ],
        ),
      ),
    );
  }
}

class MyPortfolioDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  const MyPortfolioDetailScreen({ required this.title, required this.description, super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network('https://images.unsplash.com/photo-1714756034183-42581eacfb05?q=80&w=720&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 3.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
            ),
          ),
        ],
      ),
    );
  }
}