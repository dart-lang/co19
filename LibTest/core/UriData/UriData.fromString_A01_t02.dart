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
 * mimeType parameter specified
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

check(String content, String mType) {
  UriData uriData = new UriData.fromString(content, mimeType: mType);

  Expect.equals(encodeString(content), uriData.contentText);
  Expect.equals(mType, uriData.mimeType);
  Expect.mapEquals({}, uriData.parameters);
  Expect.equals("data:" + encodeString(mType,
      encoding: Encoding.getByName("utf-8")) + "," + encodeString(content),
      uriData.toString());
}

main() {
  check("", "image/gif");
  check("", "a/b");
  check(reserved, "image/gif");
  check(reserved, "a/b");
  check(unreserved, "image/gif");
  check(unreserved, "a/b");
  check(unreserved, "а/б");
  check(unreserved, "Кириллица / прекрасна");
}
