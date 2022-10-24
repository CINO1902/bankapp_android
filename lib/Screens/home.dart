import 'package:bankapp/api/services.dart';
import 'package:bankapp/linkfile/services.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:bankapp/pages/market.dart';
import 'package:bankapp/pages/orders.dart';
import 'package:bankapp/pages/portfolio.dart';
import 'package:bankapp/pages/profile.dart';
import 'package:provider/provider.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadusers();
  }

  static const screens = [
    portfolio(),
    Market(),
    Order(),
    Profile(),
  ];
  _loadusers() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Services(),
          ),
        ],
        child: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          //backgroundColor: Color.fromARGB(255, 213, 213, 213),
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          selectedItemColor: Theme.of(context).colorScheme.onTertiary,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
          unselectedItemColor:
              Theme.of(context).colorScheme.onTertiary.withOpacity(0.7),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.transfer_within_a_station),
              label: 'Payment',
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Budget',
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            )
          ]),
    );
  }
}
