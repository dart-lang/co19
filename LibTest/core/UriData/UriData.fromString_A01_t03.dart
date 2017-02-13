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
 * encoding parameter specified
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

check(String content, String encodingName) {
  Encoding encoding = Encoding.getByName(encodingName);
  UriData uriData = new UriData.fromString(content, encoding: encoding);

  Expect.equals(encodeString(content, encoding:  encoding),
      uriData.contentText);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.mapEquals({"charset": encodingName}, uriData.parameters);
  Expect.equals("data:;charset=" + encoding.name + "," + encodeString(content,
      encoding:  encoding), uriData.toString());
}

main() {
  check("Some data", "utf-8");
  check("", "utf-8");
  check(reserved, "utf-8");
  check(unreserved, "utf-8");
  check("Non-ASCII: Кириллица прекрасна!", "utf-8");
}
