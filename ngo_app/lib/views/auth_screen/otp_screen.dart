import 'dart:async';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/views/home/home.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  int start = 59;
  void startTimer(){
    const onSec = Duration(seconds: 1);
    Timer.periodic(onSec, (timer){
      if(start == 0){
        setState(() {
          timer.cancel();
        });
      }else{
        setState(() {
          start--;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 143.69,
                  width: 200,
                  margin: const EdgeInsets.only(top: 189),
                  child: Image.asset(mobileIcon, ),
                ),
                20.heightBox,
                verifyMobile.text.fontFamily(semibold).fontWeight(FontWeight.w600).size(20).make(),
                30.heightBox,
                verifyMsg.text.color(fontsLight).fontFamily(regular).fontWeight(FontWeight.w400).size(15).make(),
                8.heightBox,
                sampleNumber.text.fontFamily(bold).fontWeight(FontWeight.w400).size(15).make(),
                30.heightBox,
                enterOtpReq.text.fontFamily(bold).fontWeight(FontWeight.w400).size(15).make(),
                20.heightBox,
                OtpTextField(
                  mainAxisAlignment: MainAxisAlignment.center,
                  fillColor: white,
                  filled: true,
                  numberOfFields: 6,
                  borderColor: borderColor,
                  showFieldAsBox: true,
                  onCodeChanged: (code) {
                    print(code);
                  },
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Resend OTP".text.fontFamily(bold).fontWeight(FontWeight.w400).size(15).make(),
                    60.widthBox,
                    "00:$start".text.color(red).fontFamily(bold).fontWeight(FontWeight.w400).size(15).make().onTap((){startTimer();}),
                    5.widthBox,
                    "Sec".text.fontFamily(bold).fontWeight(FontWeight.w400).size(15).make()

                  ],
                ),
              ],
            ),

            Positioned(
              bottom: 40,
                left: 8,
                right: 8,
                child: customButton(onPressed: (){Get.to(const Home());}, text: "Next")
            )

          ],
        ),
      ),
    );
  }
}
