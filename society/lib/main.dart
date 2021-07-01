import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society/admin/profile.dart';
import 'package:society/provider/user_provider.dart';
import 'package:society/screens/login1.dart';
import 'package:society/widgets/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider.initialize())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            backgroundColor: Colors.blueGrey, primaryColor: Colors.blueAccent),
        home: ScreensController(),
      )));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginOne();
      case Status.Authenticated:
        return SplashScreen();
      default:
        return LoginOne();
    }
  }
}
