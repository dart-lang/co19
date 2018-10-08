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
 * @description Checks that if encoding is not provided and parameters has a
 * charset entry, that name is looked up using Encoding.getByName, and if the
 * lookup returns an encoding, that encoding is used to convert content to bytes
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

check(String content, Map<String, String> parameters) {
  UriData uriData = new UriData.fromString(content, parameters: parameters);

  Expect.equals(encodeString(content, encoding:
    Encoding.getByName(parameters["charset"])), uriData.contentText);
  Expect.equals("text/plain", uriData.mimeType);
  Expect.mapEquals(parameters, uriData.parameters);
  Expect.equals("data:;charset=" + parameters["charset"] + "," +
      encodeString(content, encoding: Encoding.getByName(parameters["charset"])),
      uriData.toString());
}

main() {
  check("Some data", {"charset": "utf-8"});
  check("", {"charset": "utf-8"});
  check(reserved, {"charset": "utf-8"});
  check(unreserved, {"charset": "utf-8"});
  check("Non-ASCII: Кириллица прекрасна!", {"charset": "utf-8"});
}
