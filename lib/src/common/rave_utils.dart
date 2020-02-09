import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:tripledes/tripledes.dart';

bool isEmpty(String string) {
  return string == null || string.trim().isEmpty;
}

String formatAmount(num amount) {
  return new NumberFormat.currency(name: '').format(amount);
}

String getEncryptedData(String str, String key) {
  var blockCipher = BlockCipher(TripleDESEngine(), key);
  return blockCipher.encodeB64(str);
}

/// Remove all line feed, carriage return and whitespace characters
String cleanUrl(String url) {
  return url.replaceAll(RegExp(r"[\n\r\s]+"), "");
}

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

putIfNotNull({@required Map map, @required key, @required value}) {
  if (value == null || (value is String && value.isEmpty)) {
    return;
  }

  map[key] = value;
}
