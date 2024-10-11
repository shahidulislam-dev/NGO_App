import 'package:ngo_app/const/const.dart';

Widget customButton({onPressed, text}){
  return Positioned(
    bottom: 40,
    left: 5,
    right: 5,
    child: Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xFF2083C3).withOpacity(0.8),
          offset: const Offset(0, 5),
          blurRadius: 10,
        ),
      ],),
      child: ElevatedButton(

        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: const Color(0xFF2083C3).withOpacity(0.8),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: gradientBackground,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,
              width: 2,
            ),

          ),
          child: Container(
            height: 50,
            alignment: Alignment.center,
            child: "$text".text.white.size(20).bold.make(),
        ),
      ),
        ),
    ),
  );
}