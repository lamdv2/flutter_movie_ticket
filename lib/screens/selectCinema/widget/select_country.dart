import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../themes/app_colors.dart';
import '../../../themes/app_styles.dart';
import '../../../utils/constants.dart';
import '../../../utils/helper.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({
    super.key,
    required this.size,
    required this.items,
  });

  final Size size;
  final List<String> items;

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height / 14,
      margin: const EdgeInsets.only(
        top: kMediumPadding,
        left: kDefaultIconSize,
        right: kDefaultIconSize,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.white),
        borderRadius: kSmallBorderRadius,
      ),
      child: Row(
        children: [
          const Expanded(
            flex: 1,
            child: TextField(
              decoration: InputDecoration(
                // hintText: 'Select Your Country',
                // hintStyle: AppStyles.h4,
                icon: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ImageIcon(
                    AssetImage(AssetHelper.icoLocation),
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(right: 8.0),
              // child: IconButton(
              //   onPressed: () {
              //     Navigator.of(context).pop();
              //   },
              //   icon: const Icon(
              //     Icons.arrow_drop_down_outlined,
              //     color: AppColors.white,
              //     size: kTop32Padding,
              //   ),
              // ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  hint: Text(
                    'Select Your Country',
                    style: AppStyles.h4.copyWith(color: AppColors.white),
                  ),
                  dropdownStyleData: const DropdownStyleData(
                    decoration: BoxDecoration(
                      color: AppColors.greyBackground,
                      borderRadius: kDefaultBorderRadius,
                    ),
                  ),
                  items: widget.items
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: AppStyles.h4,
                          ),
                        ),
                      )
                      .toList(),
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    height: 40,
                    width: 140,
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    height: 40,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
