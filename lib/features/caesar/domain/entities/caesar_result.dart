class CaesarResult {
  const CaesarResult({
    required this.input,
    required this.output,
    required this.shift,
    required this.isEncrypt,
  });

  final String input;
  final String output;
  final int shift;
  final bool isEncrypt;
}
