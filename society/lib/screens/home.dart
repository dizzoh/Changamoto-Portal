import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society/provider/user_provider.dart';

import 'drawe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(body: DrawerPage());
  }
}
