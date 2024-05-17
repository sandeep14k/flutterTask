import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MailListPage extends StatelessWidget {
  const MailListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 30, 144, 225),
        title: const Text('Inbox'),
        automaticallyImplyLeading: false, // Remove back button
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.folder),
            onPressed: () {
              // Handle folder icon press
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Handle refresh icon press
            },
          ),
          PopupMenuButton<int>(
            onSelected: (item) => onSelected(context, item),
            itemBuilder: (context) => [
              PopupMenuItem<int>(value: 0, child: Text('Option 1')),
              PopupMenuItem<int>(value: 1, child: Text('Option 2')),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('Inbox'),
              onTap: () {
                // Handle Inbox tap
              },
            ),
            ListTile(
              leading: Icon(Icons.send),
              title: Text('Sent'),
              onTap: () {
                // Handle Sent tap
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Background color for inbox
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return _buildEmailItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailItem(BuildContext context, int index) {
    final List<String> senders = [
      'John Doe',
      'Jane Smith',
      'Alice Johnson',
      'Bob Brown',
      'Emily Davis',
      'Michael Wilson'
    ];

    final List<String> subjects = [
      'Meeting Agenda',
      'Vacation Plans',
      'Important Announcement',
      'Payment Confirmation',
      'Job Opportunity',
      'Feedback Request'
    ];

    final List<String> froms = [
      'john.doe@example.com',
      'jane.smith@example.com',
      'alice.johnson@example.com',
      'bob.brown@example.com',
      'emily.davis@example.com',
      'michael.wilson@example.com'
    ];

    final List<String> tos = [
      'recipient1@example.com',
      'recipient2@example.com',
      'recipient3@example.com',
      'recipient4@example.com',
      'recipient5@example.com',
      'recipient6@example.com'
    ];

    final List<String> ccs = [
      'cc1@example.com',
      'cc2@example.com',
      'cc3@example.com',
      'cc4@example.com',
      'cc5@example.com',
      'cc6@example.com'
    ];

    final List<String> dates = [
      '2023-05-17',
      '2023-05-18',
      '2023-05-19',
      '2023-05-20',
      '2023-05-21',
      '2023-05-22'
    ];

    final List<String> contents = [
      'This is the content of the email from John Doe.',
      'This is the content of the email from Jane Smith.',
      'This is the content of the email from Alice Johnson.',
      'This is the content of the email from Bob Brown.',
      'This is the content of the email from Emily Davis.',
      'This is the content of the email from Michael Wilson.'
    ];

    return ListTile(
      leading: CircleAvatar(
        child: Text(senders[index][0]), // Display first letter of sender's name
      ),
      title: Text(subjects[index]),
      subtitle: Text(senders[index]),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MailViewPage(
              sender: senders[index],
              subject: subjects[index],
              from: froms[index],
              to: tos[index],
              cc: ccs[index],
              date: dates[index],
              content: contents[index],
            ),
          ),
        );
      },
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        // Handle Option 1
        break;
      case 1:
        // Handle Option 2
        break;
    }
  }
}

class MailViewPage extends StatelessWidget {
  final String sender;
  final String subject;
  final String from;
  final String to;
  final String cc;
  final String date;
  final String content;

  const MailViewPage({
    Key? key,
    required this.sender,
    required this.subject,
    required this.from,
    required this.to,
    required this.cc,
    required this.date,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Mail')),
        backgroundColor: Color.fromARGB(255, 30, 144, 225),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                subject,
                style: TextStyle(fontSize: 24),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  child:
                      Text(sender[0]), // Display first letter of sender's name
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'From:  $from',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sender:  $sender',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'To:  $to',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Cc:  $cc',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Date:  $date',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 16.0),
            Text(content),
          ],
        ),
      ),
    );
  }
}
