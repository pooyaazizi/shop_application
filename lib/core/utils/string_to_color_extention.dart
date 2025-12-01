import 'dart:ui';

extension StringToColor on String {
  Color toColor() {
    String hexColor = this.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor =
          "FF" +
          hexColor; // Add alpha value if not provided
    }
    return Color(int.parse('$hexColor', radix: 16));
  }
}
