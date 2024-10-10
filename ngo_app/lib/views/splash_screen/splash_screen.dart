import 'package:ngo_app/const/const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: gradientBackground, // Your gradient constant
        ),
        child: Stack(
          children: [
            // Top House Image
            Positioned(
              left: -125,
              top: 15,
              child: Opacity(
                opacity: 0.03,
                child: Image.asset(
                  topHouse,
                  width: 252, // Width
                  height: 279, // Height
                ),
              ),
            ),
            // Center Splash Image
            Align(
              alignment: Alignment.center,
              child: Transform.rotate(
                angle: -25.82 * (3.14159 / 180),
                child: Image.asset(
                  splashImage,
                  width: 500,
                  height: 500,
                ),
              ),
            ),
            // Bottom House Image
            Positioned(
              left: 286,
              top: 625,
              child: Opacity(
                opacity: 0.03,
                child: Image.asset(
                  bottomHouse,
                  width: 224.83, // Width
                  height: 220.66, // Height
                ),
              ),
            ),
            // Text at the bottom of the screen
            Positioned(
              bottom: 70,
              left: 0,
              right: 0,
              child: Center(
                child: "NGO LOAN".text.color(white).size(55).lineHeight(10.5/55).fontWeight(FontWeight.w900).make(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


