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
 * parameters parameter specified
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

check(String content, Map<String, String> parameters) {
  UriData uriData = new UriData.fromString(content, parameters: parameters);

  Expect.equals(encodeString(content), uriData.contentText);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.mapEquals(parameters, uriData.parameters);
  Expect.equals("data:" + map2query(parameters) + "," + encodeString(content),
      uriData.toString());
}

String map2query(Map<String, String> map) {
  StringBuffer sb = new StringBuffer();
  Iterator it = map.keys.iterator;
  while (it.moveNext()) {
    sb.write(";" + encodeString(it.current) + "=" +
        encodeString(map[it.current], encoding: Encoding.getByName("utf-8")));
  }
  return sb.toString();
}

main() {
  check("Some data", {"a": "b", "c": "d"});
  check("", {});
  check(reserved, {});
  check(unreserved, {"a": "b c"});
  check("Some data", {"a 1": "b"});
  check("Some data", {"a": "Кириллица прекрасна!"});
}
