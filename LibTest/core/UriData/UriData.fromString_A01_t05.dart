/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UriData.fromString(
 *  String content, {
 *  String mimeType,
 *  Encoding encoding,
 *  Map<String, String> parameters,
 *  bool base64: false
 *  })
 * Creates a data: URI containing the content string.
 * Equivalent to new Uri.dataFromString(...).data, but may be more efficient if
 * the uri itself isn't used.
 * @description Checks that this constructor creates an expected UriData. Test
 * base64 parameter specified
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

check(String content) {
  UriData uriData = new UriData.fromString(content,
      encoding: Encoding.getByName("utf-8"), base64: true);
  Expect.equals(base64.encode(utf8.encode(content)), uriData.contentText);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.mapEquals({"charset": "utf-8"}, uriData.parameters);
  Expect.equals("data:;charset=utf-8;base64," +
      base64.encode(utf8.encode(content)), uriData.toString());
}

main() {
  check("Some data");
  check("");
  check(reserved);
  check(unreserved);
  check("Non ASCII: Кириллица прекрасна!");
}
