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
 * percentEncoded argument specified
 * @issue 28604
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "UriDataEncoder.lib.dart";

main() {
  List<int> data = [];
  for (int i = 0; i < 256; i++) {
    data.add(i);
  }
  Uri uri = new Uri.dataFromBytes(data, percentEncoded: true);

  Expect.equals(encodeList(data), uri.data.contentText);
  Expect.equals("application/octet-stream", uri.data.mimeType);

  Expect.equals("data", uri.scheme);
  Expect.equals("", uri.userInfo);
  Expect.equals("", uri.host);
  Expect.equals(0, uri.port);
  Expect.equals("", uri.fragment);
}
