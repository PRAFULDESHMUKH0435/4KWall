import 'package:flutter/material.dart';
import 'package:fourkwall/Constants/Routes/generateroutes.dart';
import 'package:fourkwall/Constants/Routes/routes.dart';
import 'package:fourkwall/Model/models.dart';
import 'package:fourkwall/Providers/splashscreenprovider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); // Initialize Hive
  await Hive.openBox("DataBox"); // Open your box
    await Hive.openBox("LikedItems"); // Open your box
    // Register adapters for each custom type
  Hive.registerAdapter(ImageDataModelAdapter());  
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashScreenProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splashscreen,
        onGenerateRoute: Routes.generateRoutes,
      ),
    );
  }
}
