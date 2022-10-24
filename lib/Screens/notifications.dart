
import 'package:flutter/material.dart';



class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              'You have no notifications yet',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ))
          ],
        ),
      
    );
  }
}
