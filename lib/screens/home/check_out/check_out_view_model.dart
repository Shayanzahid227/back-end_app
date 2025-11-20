import 'package:flutter/material.dart';
import 'package:hustler_syn/core/base_view_model/base_view_model.dart';
import 'package:hustler_syn/core/constant/colors.dart';

class CheckOutViewModel extends BaseViewModel {
  final TextEditingController dateController = TextEditingController();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor, // Your primary color
            colorScheme:
                ColorScheme.light(primary: primaryColor), // Your primary color
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      dateController.text =
          "${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}/${picked.year}";
    }
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }
}
