import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const WhatsAppUI());
}

class WhatsAppUI extends StatelessWidget {
  const WhatsAppUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF075e54),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: const Color(0xFF25d366),
        ),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.teal.shade900,
            title: const Text('WhatsApp'),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 26),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                color: Colors.white,
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.more_vert),
                color: Colors.white,
                onPressed: () {},
              ),
            ],
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text(
                    'Chats',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    'Status',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Tab(
                  child: Text(
                    'Calls',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelStyle: TextStyle(fontSize: 16),
            ),
          ),
          body: TabBarView(
            children: [
              _buildChatsPage(),
              _buildStatusPage(),
              _buildCallsPage(),
            ],
          ),
        ),
      ),
    );
  }

  static const List<String> _names = [
    'Daniyal',
    'Faraz',
    'Shahid',
    'Zubair',
    'Abdullah',
    'Bilal',
  ];

  String _getRandomName() {
    final random = Random();
    return _names[random.nextInt(_names.length)];
  }

  Widget _buildChatsPage() {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        final random = Random();
        final hour = random.nextInt(24);
        final minute = random.nextInt(60);
        final time = '$hour:${minute.toString().padLeft(2, '0')}';
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.black,
            child: Icon(Icons.person),
          ),
          title: Text(_getRandomName()),
          subtitle: Text('Last message from ${_getRandomName()}'),
          trailing: Text(time),
        );
      },
    );
  }

  Widget _buildStatusPage() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        final random = Random();
        final hour = random.nextInt(24);
        final minute = random.nextInt(60);
        final time = '$hour:${minute.toString().padLeft(2, '0')}';
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Icon(Icons.account_circle),
          ),
          title: Text(_getRandomName()),
          subtitle: Text('Added a new status'),
          trailing: Text(time),
        );
      },
    );
  }

  Widget _buildCallsPage() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        final random = Random();
        final hour = random.nextInt(24);
        final minute = random.nextInt(60);
        final time = '$hour:${minute.toString().padLeft(2, '0')}';
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            child: Icon(Icons.call),
          ),
          title: Text(_getRandomName()),
          subtitle: Text('Calls'),
          trailing: Text(time),
        );
      },
    );
  }
}
