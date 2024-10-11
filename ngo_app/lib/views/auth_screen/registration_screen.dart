import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_button.dart';
import 'package:ngo_app/widgets_common/custom_checkbox.dart';
import 'package:ngo_app/widgets_common/custom_dropdown.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController nameController = TextEditingController();
  bool? isSelected = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bgWidget(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 12, right: 12),
          child: Stack(
            children: [
              Column(
                children: [
                  Center(child: loan.text.size(58).fontFamily(bold).fontWeight(FontWeight.w900).lineHeight(10.5/58).color(white).make()),
                  40.heightBox,
                  register.text.size(24).fontFamily(regular).fontWeight(FontWeight.w600).color(white).make(),
                  20.heightBox,
                  registerMsg.text.size(18).color(white).align(TextAlign.center).make(),
                  20.heightBox,
                  CustomTextfield(controller: nameController, hintText: nameHint, prefixIcon: const Icon(Icons.person, color: iconColor,size: 40),),
                  20.heightBox,
                  CustomTextfield(controller: nameController, hintText: mobileHint, prefixIcon: const Icon(Icons.phone_in_talk, color: iconColor,size: 40),),
                  20.heightBox,
                  const CustomDropdowns(),
                  17.heightBox,
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(alignment: Alignment.centerLeft,child: gender.text.white.fontFamily(regular).size(20).make()),
                        30.widthBox,
                        Container(height: 20, width: 20, decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: gradientBackground,
                            border: Border.all(color: white, width: 2)
                        ),),
                        10.widthBox,
                        female.text.white.fontFamily(semibold).size(20).make()
                      ],
                    ),
                  ),
                  50.heightBox,
                  const CustomCheckbox(),
                ],
              ),
              customButton(onPressed: (){}, text: "Continue")
            ]
          ),
        )
      ),
    );
  }
}
