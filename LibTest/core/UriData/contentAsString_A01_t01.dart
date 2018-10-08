/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String contentAsString({Encoding encoding})
 * Returns a string created from the content of the data URI.
 *
 * If the content is Base64 encoded, it will be decoded to bytes and then
 * decoded to a string using encoding. If encoding is omitted, the value of a
 * charset parameter is used if it is recognized by Encoding.getByName,
 * otherwise it defaults to the ASCII encoding, which is the default encoding
 * for data URIs that do not specify an encoding.
 *
 * If the content is not Base64 encoded, it will first have percent-escapes
 * converted to bytes and then the character codes and byte values are decoded
 * using encoding
 * @description Checks that this method returns a string created from the
 * content of the data URI. Test not Base64 encoded content
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

check(String content, [Encoding encoding]) {
  UriData uriData = new UriData.fromString(content, encoding: encoding);
  String expected = content;
  Expect.equals(expected, uriData.contentAsString(encoding: encoding));
  Expect.equals(expected, uriData.contentAsString());

  if (encoding != null) {
    uriData = new UriData.fromString(content,
        parameters: {"charset": encoding.name });
    expected = content;
    Expect.equals(expected, uriData.contentAsString(encoding: encoding));
    Expect.equals(expected, uriData.contentAsString());
  }
}

main() {
  check("Some data");
  check("Non-ASCII: Кириллица прекрасна", Encoding.getByName("utf-8"));
}
