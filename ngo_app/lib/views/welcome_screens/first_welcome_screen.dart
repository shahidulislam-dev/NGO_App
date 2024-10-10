
import 'package:ngo_app/const/const.dart';
import 'package:get/get.dart';
import 'package:ngo_app/views/welcome_screens/second_welcome_screen.dart';
import 'package:ngo_app/widgets_common/floatingButton.dart';
import 'package:ngo_app/widgets_common/welcome_screen.dart';


class FirstWelcomeScreen extends StatelessWidget {
  const FirstWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: floatingButton().onTap((){Get.to(const SecondWelcomeScreen());}),
      body: welcomeScreen(imagePath: firstWelcome, text1: "Keep Smiling and meet your", text2:"needs with quick Loans" )
    );
  }
}

