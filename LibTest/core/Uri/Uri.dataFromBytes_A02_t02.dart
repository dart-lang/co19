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
 * parameters
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  var data = [0, 1, 2];
  Uri uri = new Uri.dataFromBytes(data, parameters: {"a": " "});
  Expect.equals("data:application/octet-stream;a=%20;base64," +
      base64.encode(data), uri.data.toString());

  uri = new Uri.dataFromBytes(data, parameters: {"й": " ф "});
  Expect.equals("data:application/octet-stream;%D0%B9=%20%D1%84%20;base64," +
      base64.encode(data), uri.data.toString());
}
