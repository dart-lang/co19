/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri.dataFromBytes(
 *  List<int> bytes, {
 *  mimeType: "application/octet-stream",
 *  Map<String, String> parameters,
 *  percentEncoded: false
 *  })
 * Creates a data: URI containing an encoding of bytes.
 *
 * Defaults to Base64 encoding the bytes, but if percentEncoded is true, the
 * bytes will instead be percent encoded (any non-ASCII or
 * non-valid-ASCII-character byte is replaced by a percent encoding).
 *
 * To read the bytes back, use UriData.contentAsBytes.
 *
 * It defaults to having the mime-type application/octet-stream. The mimeType
 * and parameters are added to the created URI. If any of these contain
 * characters that are not allowed in the data URI, the character is
 * percent-escaped. If the character is non-ASCII, it is first UTF-8 encoded
 * and then the bytes are percent encoded.
 * @description Checks that this constructor creates an expected Uri. Test
 * default parameters
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

check(List<int> data) {
  Uri uri = new Uri.dataFromBytes(data);

  Expect.equals(base64.encode(data), uri.data.contentText);
  Expect.equals("application/octet-stream", uri.data.mimeType);
  Expect.mapEquals({}, uri.data.parameters);
  Expect.equals("data:application/octet-stream;base64," + base64.encode(data),
      uri.data.toString());
  Expect.equals("data", uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals(0, uri.port);
  Expect.equals("application/octet-stream;base64," + base64.encode(data),
      uri.path);
  Expect.equals("", uri.query);
  Expect.equals("", uri.fragment);
}

main() {
  check("Some data to encode".codeUnits);
  check([]);
  List<int> l = [];
  for (int i = 0; i < 256; i++) {
    l.add(i);
  }
  check(l);
}
