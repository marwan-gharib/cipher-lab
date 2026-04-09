class VigenereStep {
  const VigenereStep({
    required this.inputChar,
    required this.keyChar,
    required this.outputChar,
    required this.rowIndex,
    required this.colIndex,
  });

  final String inputChar;
  final String keyChar;
  final String outputChar;
  final int rowIndex;
  final int colIndex;
}
