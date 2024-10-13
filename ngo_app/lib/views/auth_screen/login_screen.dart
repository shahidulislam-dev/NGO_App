import 'package:get/get.dart';
import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/views/auth_screen/otp_screen.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mobileController = TextEditingController();
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: bgWidget(
          child: Padding(
            padding: const EdgeInsets.only(top: 100.0, left: 12, right: 12),
            child: Column(
              children: [
                Center(child: loan.text.size(58).fontFamily(bold).fontWeight(FontWeight.w900).lineHeight(10.5/58).color(white).make()),
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        signInto.text.size(24).fontFamily(regular).fontWeight(FontWeight.w600).color(white).make(),
                        20.heightBox,
                        signInWithMobil.text.size(18).color(white).align(TextAlign.center).make(),
                        70.heightBox,
                        CustomTextfield(controller: mobileController,keyboardType: TextInputType.number, hintText: mobileHint, prefixIcon: const Icon(Icons.phone_in_talk, color: iconColor,size: 40)),
                        40.heightBox,
                        customButton(onPressed: (){Get.to(const OtpScreen());}, text: "Login")
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ));
  }
}
