import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';

import 'package:ngo_app/firebase_options.dart';
import 'package:ngo_app/social_media_auth/google_auth.dart';
import 'package:ngo_app/test_screen/data_test.dart';
import 'package:ngo_app/views/splash_screen/splash_screen.dart';
import 'package:ngo_app/views/welcome_screens/first_welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const FirstWelcomeScreen(),
    );
  }
}


