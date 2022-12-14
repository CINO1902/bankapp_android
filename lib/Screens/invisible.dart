import 'package:bankapp/Screens/chooselog.dart';
import 'package:bankapp/Screens/home.dart';
import 'package:bankapp/linkfile/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import '../linkfile/providerlink/loader.dart';
class invisible extends StatefulWidget {
  const invisible({Key? key}) : super(key: key);

  @override
  State<invisible> createState() => _invisibleState();
}

class _invisibleState extends State<invisible> {
  bool? value;
  bool? value1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => checkState());
  }

  final prefs = SharedPreferences.getInstance();
  checkState() async {
    final prefs = await SharedPreferences.getInstance();
    bool? value = await prefs.getBool('showhome');
    // print(value);
    setState(() {
      value1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
        final value = Provider.of<checkstate>(context, listen: true).value;
    final getlogged = Provider.of<checklogged>(context, listen: true).value;

    return value
        ? const onBoarding()
        : getlogged
            ? const chooselog()
            : home();
  }
}
