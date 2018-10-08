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
 * @description Checks that this constructor creates an expected UriData. Test
 * parameters argument specified
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(List<int> bytes, Map<String, String> parameters) {
  UriData uriData = new UriData.fromBytes(bytes, parameters: parameters);

  Expect.equals(base64.encode(bytes), uriData.contentText);
  Expect.equals("application/octet-stream", uriData.mimeType);
  Expect.mapEquals(parameters, uriData.parameters);
}

main() {
  List<int> l = [];
  for (int i = 0; i < 256; i++) {
    l.add(i);
  }
  check(l, {"a": "1", "b": "2"});
  check(l, {});
  check(l, {"a": " "});
  check(l, {"a": " ф "});
  check(l, {"й": " ф "});
}
