import 'package:ngo_app/const/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: "Home Screen".text.make(),
      ),
    );
  }
}
