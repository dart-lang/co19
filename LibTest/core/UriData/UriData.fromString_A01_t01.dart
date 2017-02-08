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
 * default parameters
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

check(String content) {
  UriData uriData = new UriData.fromString(content);

  Expect.equals(encodeString(content), uriData.contentText);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.mapEquals({}, uriData.parameters);
  Expect.equals("data:," + encodeString(content), uriData.toString());
}

main() {
  check("");
  check(reserved);
  check(unreserved);

  String s = "";
  for (int i = 0; i < 128; i++) {
    s += new String.fromCharCode(i);
  }
  check(s);
}
