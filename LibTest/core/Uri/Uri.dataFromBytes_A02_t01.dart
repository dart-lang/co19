/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri.dataFromBytes(
 *  List<int> bytes, {
 *  mimeType: "application/octet-stream",
 *  Map<String, String> parameters,
 *  percentEncoded: false
 *  })
 * Creates a data: URI containing an encoding of bytes.
 *
 * ...
 * The mimeType and parameters are added to the created URI. If any of these
 * contain characters that are not allowed in the data URI, the character is
 * percent-escaped. If the character is non-ASCII, it is first UTF-8 encoded
 * and then the bytes are percent encoded.
 * @description Checks that if mimeType or parameters contain characters that
 * are not allowed in the data URI, the character is percent-escaped. Test
 * mimeType
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  var data = [0, 1, 2];
  Uri uri = new Uri.dataFromBytes(data, mimeType: " image / gif ");
  Expect.equals("data:%20image%20/%20gif%20;base64," + base64.encode(data),
      uri.data.toString());

  uri = new Uri.dataFromBytes(data, mimeType: " абра / кадабра ");
  Expect.equals("data:%20%D0%B0%D0%B1%D1%80%D0%B0%20/%20%D0%BA%D0%B0%D0%B4%D0"
      "%B0%D0%B1%D1%80%D0%B0%20;base64," + base64.encode(data),
      uri.data.toString());
}
