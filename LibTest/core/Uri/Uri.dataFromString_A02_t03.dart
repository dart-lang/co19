/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri.dataFromString(
 *  String content, {
 *  String mimeType,
 *  Encoding encoding,
 *  Map<String, String> parameters,
 *  bool base64: false
 *  })
 * Creates a data: URI containing the content string.
 * ...
 * If encoding is not provided and parameters has a charset entry, that name is
 * looked up using Encoding.getByName, and if the lookup returns an encoding,
 * that encoding is used to convert content to bytes. If providing both an
 * encoding and a charset parameter, they should agree, otherwise decoding
 * won't be able to use the charset parameter to determine the encoding.
 * ...
 * @description Checks that if both an encoding and a charset parameter are
 * specified and they disagree, then encoding parameter is used
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "UriDataEncoder.lib.dart";

check(String content, Map<String, String> parameters) {
  Uri uri = new Uri.dataFromString(content, parameters: parameters);

  Expect.equals(encodeString(content, encoding:
    Encoding.getByName(parameters["charset"])), uri.data.contentText);
  Expect.equals("text/plain", uri.data.mimeType);
  Expect.mapEquals(parameters, uri.data.parameters);
  Expect.equals("data:;charset=" + parameters["charset"] + "," +
      encodeString(content, encoding: Encoding.getByName(parameters["charset"])),
      uri.data.toString());

  Expect.equals("data", uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals(0, uri.port);
  Expect.equals("", uri.fragment);
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
