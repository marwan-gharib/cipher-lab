import 'vigenere_step.dart';

class VigenereResult {
  const VigenereResult({
    required this.input,
    required this.output,
    required this.key,
    required this.steps,
    required this.isEncrypt,
  });

  final String input;
  final String output;
  final String key;
  final List<VigenereStep> steps;
  final bool isEncrypt;
}
