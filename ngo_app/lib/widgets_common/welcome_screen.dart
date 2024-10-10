import 'package:ngo_app/const/const.dart';

Widget welcomeScreen({imagePath, text1, text2}){
  return Container(
      decoration: const BoxDecoration(
        gradient: gradientBackground, // Your gradient constant
      ),
      child: Column(
          children:[
            Container(
              height: 504,
              width: 424,
              decoration: const BoxDecoration(
                  color: white,
                  boxShadow: [BoxShadow(
                      color: Colors.black,
                      offset: Offset(0, 0),
                      blurRadius: 20.0,
                      spreadRadius: 0.0
                  )]
              ),
              child: Image.asset(imagePath,fit: BoxFit.cover,),
            ),
            30.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) =>
                  Row(
                    children: [
                      Container(
                        height: 6,
                        width: 6.88,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      if (index < 3) // Add spacing only if it's not the last element
                        const SizedBox(width: 15),
                    ],
                  ),
              ).expand((widget) => [widget]).toList(), // Flatten the list of rows
            ),
            30.heightBox,
            "$text1".text.color(white).size(22).lineHeight(10.5/32).fontWeight(FontWeight.w700).make(),
            25.heightBox,
            "$text2".text.color(white).size(22).lineHeight(10.5/32).fontWeight(FontWeight.w700).make(),
          ]
      )
  );
}