import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ngo_app/const/colors.dart';
import '../model/districts.dart';
import 'package:velocity_x/velocity_x.dart'; // For text styling

class CustomDropdowns extends StatefulWidget {
  const CustomDropdowns({super.key});

  @override
  State<CustomDropdowns> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdowns> {
  final districtsList = <String>[].obs;
  final dropValue = ''.obs;
  final TextEditingController textEditingController = TextEditingController();

  // Load districts from JSON file
  Future<void> getDistricts() async {
      var data = await rootBundle.loadString("lib/service/districts.json");
      var jsonData = districtsModelFromJson(data); // Ensure this is correct
      var districtNames = jsonData.districts.map((e) => e.name).toList();
      districtsList.assignAll(districtNames);

  }

  @override
  void initState() {
    super.initState();
    getDistricts(); // Load districts in initState
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        padding: const EdgeInsets.only(left: 2.0),
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on, color: iconColor, size: 40), // Icon on the left
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2<String>(
                  isExpanded: true,
                  hint: const Text(
                    'Select a district',
                    style: TextStyle(
                      fontSize: 18,
                      color: darkGrey,
                    ),
                  ),

                  items: districtsList
                      .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 18,
                        color: darkGrey
                      ),
                    ),
                  ))
                      .toList(),
                  value: dropValue.value.isNotEmpty ? dropValue.value : null,
                  onChanged: (value) {
                    setState(() {
                      dropValue.value = value!;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 16),
                    height: 50, // Adjusted height
                    width: 200,
                  ),
                  dropdownStyleData:const DropdownStyleData(
                    maxHeight: 250,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0),
                      ),
                    )
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Container(
                      height: 50,
                      padding: const EdgeInsets.only(
                        top: 8,
                        bottom: 4,
                        right: 8,
                        left: 8,
                      ),
                      child: TextFormField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 8,
                          ),
                          hintText: 'Search for a district...',
                          hintStyle: const TextStyle(fontSize: 16),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      return item.value.toString().toLowerCase().contains(searchValue.toLowerCase());
                    },
                  ),
                  // Clear the search value when you close the menu
                  onMenuStateChange: (isOpen) {
                    if (!isOpen) {
                      textEditingController.clear();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ).box.color(Colors.white).border(color: borderColor, width: 1.5).roundedSM.make(); // Styled container
    });
  }
}
