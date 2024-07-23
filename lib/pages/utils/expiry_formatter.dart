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

class CreditCardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Replace any non-digit characters
    String newText = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Insert dashes after every four digits
    String formattedText = '';
    for (int i = 0; i < newText.length; i++) {
      if (i > 0 && i % 4 == 0) {
        formattedText += '-';
      }
      formattedText += newText[i];
    }

    // Determine the correct cursor position
    int selectionIndex = formattedText.length;
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
