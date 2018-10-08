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
 * @description Checks that if both an encoding and a charset parameter are
 * specified and they disagree, then encoding parameter is used
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
  String content = "Non-ASCII: Кириллица прекрасна!";
  Encoding encoding = Encoding.getByName("utf-8");

  Expect.throws(() {
    new Uri.dataFromString(content, encoding: Encoding.getByName("US-ASCII"),
        parameters: {"charset": "utf-8"});
  });

  Uri uri = new Uri.dataFromString("Non-ASCII: Кириллица прекрасна!",
      encoding: encoding, parameters: {"charset": "US-ASCII"});
  Expect.equals(encodeString(content, encoding: encoding), uri.data.contentText);
  Expect.equals("text/plain", uri.data.mimeType);
  Expect.mapEquals({"charset": "US-ASCII"}, uri.data.parameters);
  Expect.equals("data:;charset=US-ASCII," +
      encodeString(content, encoding: encoding), uri.data.toString());

  Expect.equals("data", uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals(0, uri.port);
  Expect.equals("", uri.fragment);
}
