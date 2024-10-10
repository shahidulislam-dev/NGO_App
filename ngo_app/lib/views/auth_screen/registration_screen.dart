import 'package:ngo_app/const/const.dart';
import 'package:ngo_app/const/styles.dart';
import 'package:ngo_app/widgets_common/bg_widget.dart';
import 'package:ngo_app/widgets_common/custom_textfield.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      body: bgWidget(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0, left: 12, right: 12),
          child: Column(
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

            ],
          ),
        )
      ),
    );
  }
}
