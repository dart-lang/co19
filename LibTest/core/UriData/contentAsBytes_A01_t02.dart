/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<int> contentAsBytes()
 * The content part of the data URI as bytes.
 * If the data is Base64 encoded, it will be decoded to bytes.
 *
 * If the data is not Base64 encoded, it will be decoded by unescaping
 * percent-escaped characters and returning byte values of each unescaped
 * character. The bytes will not be, e.g., UTF-8 decoded.
 * @description Checks that this method returns the content part of the data URI
 * as bytes. Test Base64 encoded strings
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(String content, [Encoding encoding]) {
  UriData uriData1 = new UriData.fromString(content, encoding: encoding,
      base64: false);
  UriData uriData2 = new UriData.fromString(content, encoding: encoding,
      base64: false);
  Expect.listEquals(uriData1.contentAsBytes(), uriData2.contentAsBytes());
}

main() {
  check("Some data");
  check("Non-ASCII: Кириллица прекрасна", Encoding.getByName("utf-8"));
}
