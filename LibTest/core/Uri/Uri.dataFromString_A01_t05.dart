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
 *
 * Converts the content to a bytes using encoding or the charset specified in
 * parameters (defaulting to US-ASCII if not specified or unrecognized), then
 * encodes the bytes into the resulting data URI.
 *
 * Defaults to encoding using percent-encoding (any non-ASCII or non-URI-valid
 * bytes is replaced by a percent encoding). If base64 is true, the bytes are
 * instead encoded using BASE64.
 *
 * If encoding is not provided and parameters has a charset entry, that name is
 * looked up using Encoding.getByName, and if the lookup returns an encoding,
 * that encoding is used to convert content to bytes. If providing both an
 * encoding and a charset parameter, they should agree, otherwise decoding
 * won't be able to use the charset parameter to determine the encoding.
 *
 * If mimeType and/or parameters are supplied, they are added to the created
 * URI. If any of these contain characters that are not allowed in the data URI,
 * the character is percent-escaped. If the character is non-ASCII, it is first
 * UTF-8 encoded and then the bytes are percent encoded. An omitted mimeType in
 * a data URI means text/plain, just as an omitted charset parameter defaults to
 * meaning US-ASCII.
 * @description Checks that this constructor creates an expected Uri. Test
 * base64 parameter specified
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";
import "UriDataEncoder.lib.dart";

check(String content) {
  Uri uri = new Uri.dataFromString(content,
      encoding: Encoding.getByName("utf-8"), base64: true);
  Expect.equals(base64.encode(utf8.encode(content)), uri.data.contentText);
  Expect.equals("text/plain", uri.data.mimeType);
  Expect.mapEquals({"charset": "utf-8"}, uri.data.parameters);
  Expect.equals("data:;charset=utf-8;base64," +
      base64.encode(utf8.encode(content)), uri.data.toString());

  Expect.equals("data", uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals(0, uri.port);
  Expect.equals("", uri.fragment);
}

main() {
  check("Some data");
  check("");
  check(reserved);
  check(unreserved);
  check("Non ASCII: Кириллица прекрасна!");
}
