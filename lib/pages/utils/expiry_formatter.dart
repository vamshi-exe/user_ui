import 'package:flutter/services.dart';

class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newText.length == 2 && oldValue.text.length == 1) {
      // Add "/" after MM
      return TextEditingValue(
        text: '$newText/',
        selection: TextSelection.collapsed(offset: newText.length + 1),
      );
    } else if (newText.length == 3 && !newText.contains('/')) {
      // Prevent user from deleting "/"
      return TextEditingValue(
        text: '${newText.substring(0, 2)}/${newText.substring(2)}',
        selection: TextSelection.collapsed(offset: newText.length + 1),
      );
    } else if (newText.length > 5) {
      // Limit to MM/YY format
      return oldValue;
    }

    return newValue;
  }
}
