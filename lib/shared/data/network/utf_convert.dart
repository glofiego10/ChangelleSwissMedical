import 'dart:convert';
import 'dart:typed_data';

Map<String, dynamic> decodeJsonResponse(Uint8List bodyBytes) {
  final jsonData = json.decode(
    const Utf8Decoder().convert(bodyBytes),
  ) as Map<String, dynamic>;
  return jsonData;
}
