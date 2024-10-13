import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ngo_app/const/colors.dart';
import 'package:ngo_app/model/districts.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart'; // Import the custom dropdown package
import 'package:velocity_x/velocity_x.dart'; // For text styling

Widget districtDropdown() {
  var districtsList = <String>[].obs;
  var dropValue = ''.obs;
  final TextEditingController textEditingController = TextEditingController();

  // Load districts from JSON file
  Future<void> getDistricts() async {
    var data = await rootBundle.loadString("lib/models/districts.json");
    var jsonData = districtsModelFromJson(data);
    var districtNames = jsonData.districts.map((e) => e.name).toList();

    // Update the observable list with district names
    districtsList.assignAll(districtNames);
  }

  // Call getDistricts to populate the list
  getDistricts();

  return Obx(() {
    return Container(
      padding: const EdgeInsets.only(left: 2.0),
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: iconColor, size: 40,), // Icon on the left
          Expanded(
            child: CustomDropdown(
              hintText: 'Select a district',

              items: districtsList.toList(),
              onChanged: (value) {
                dropValue.value = value!;
              },
            ),
          ),
        ],
      ),
    ).box.color(Colors.white).roundedSM.height(55).make();
  });
}
