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
 * mimeType
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  var data = [0, 1, 2];
  UriData uriData = new UriData.fromBytes(data, mimeType: " image / gif ");
  Expect.equals("data:%20image%20/%20gif%20;base64," + base64.encode(data),
      uriData.toString());

  uriData = new UriData.fromBytes(data, mimeType: " абра / кадабра ");
  Expect.equals("data:%20%D0%B0%D0%B1%D1%80%D0%B0%20/%20%D0%BA%D0%B0%D0%B4%D0"
      "%B0%D0%B1%D1%80%D0%B0%20;base64," + base64.encode(data),
      uriData.toString());
}
