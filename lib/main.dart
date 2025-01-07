import 'package:flutter/material.dart';
import 'package:mosoda/Utils/Routes/routes.dart';
import 'package:mosoda/Utils/Routes/routes_name.dart';

import 'package:mosoda/ViewModel/auth_view_model.dart';
import 'package:mosoda/ViewModel/cat_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RoutesName.mainOnBoardingScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
