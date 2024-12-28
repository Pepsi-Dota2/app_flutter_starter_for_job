class TextUtil {
  static String wrapText(String text, int maxChars) {
    if (text.length <= maxChars) return text;
    return text.replaceAllMapped(
      RegExp(r'.{1,' + maxChars.toString() + r'}'),
      (match) => '${match.group(0)}\n',
    );
  }
}
