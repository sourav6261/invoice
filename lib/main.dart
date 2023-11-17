
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice/provider/provider.dart';
import 'package:invoice/routes/app_routes.dart';
import 'package:invoice/theme/theme_helper.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
    ThemeHelper().changeTheme('primary');
  runApp(
    ChangeNotifierProvider(
      create: (context) => PasswordModel(),
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      title: 'sourav_s_application6',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.toDoListScreen,
      routes: AppRoutes.routes,
    );
  }
}
