import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: <Widget>[
          NotificationTile(
            name: 'Anna Willian',
            action: 'joined to',
            group: 'Internships',
            avatarUrl: 'https://via.placeholder.com/150',
            timeAgo: '5 mins ago',
            highlighted: true,
          ),
          NotificationTile(
            name: 'Baship J. Irwin',
            action: 'sent a',
            group: 'Play Table Tennis',
            avatarUrl: 'https://via.placeholder.com/150',
            timeAgo: '10 hours ago',
            highlighted: true,
          ),
          NotificationTile(
            name: 'Harley Jonathan Ruffo',
            action: '',
            group: '',
            avatarUrl: 'https://via.placeholder.com/150',
            timeAgo: '3 days ago',
            highlighted: false,
          ),
        ],
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String name;
  final String action;
  final String group;
  final String avatarUrl;
  final String timeAgo;
  final bool highlighted;

  const NotificationTile({
    Key? key,
    required this.name,
    required this.action,
    required this.group,
    required this.avatarUrl,
    required this.timeAgo,
    required this.highlighted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: highlighted ? Colors.purple[50] : Colors.white,
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(avatarUrl),
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' $action ',
                        style: TextStyle(color: Colors.black),
                      ),
                      TextSpan(
                        text: group,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  timeAgo,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
