/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UriData.fromBytes(
 *  List<int> bytes, {
 *  mimeType: "application/octet-stream",
 *  Map<String, String> parameters,
 *  percentEncoded: false
 *  })
 * Creates a data: URI containing an encoding of bytes.
 *
 * Equivalent to new Uri.dataFromBytes(...).data, but may be more efficient if
 * the uri itself isn't used.
 * @description Checks that if mimeType or parameters contain characters that
 * are not allowed in the data URI, the character is percent-escaped. Test
 * parameters
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  var data = [0, 1, 2];
  UriData uriData = new UriData.fromBytes(data, parameters: {"a": " "});
  Expect.equals("data:application/octet-stream;a=%20;base64," +
      base64.encode(data), uriData.toString());

  uriData = new UriData.fromBytes(data, parameters: {"й": " ф "});
  Expect.equals("data:application/octet-stream;%D0%B9=%20%D1%84%20;base64," +
      base64.encode(data), uriData.toString());
}
