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
 * as bytes. Test not Base64 encoded strings
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(String content, [Encoding encoding]) {
  UriData uriData = new UriData.fromString(content, encoding: encoding);
  List<int> expected = content.codeUnits;
  if (encoding != null) {
    expected = string2bytes(content, encoding);
  }
  Expect.listEquals(expected, uriData.contentAsBytes());
}

List<int> string2bytes(String str, Encoding encoding) {
  List<int> bytes = [];
  Iterator i = str.codeUnits.iterator;
  while (i.moveNext()) {
    int charCode = i.current;
    String char = new String.fromCharCode(charCode);
    List<int> codes = encoding.encode(char);
    bytes.addAll(codes);
  }
  return bytes;
}

main() {
  check("Some data");
  check("Non-ASCII: Кириллица прекрасна", Encoding.getByName("utf-8"));
}
