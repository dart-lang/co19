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
 * invalid mimeType parameter specified
 * @issue 28592
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {new Uri.dataFromBytes([0, 1, 2], mimeType: "Text");});

  // According to the https://github.com/dart-lang/sdk/issues/28592
  // an empty MIME types should be treated as "text/plain"
  Expect.equals("text/plain",
      new Uri.dataFromBytes([0, 1, 2], mimeType: "").data.mimeType);

  // According to the https://github.com/dart-lang/sdk/issues/28592
  // null MIME types should be treated as "application/octet-stream"
  Expect.equals("application/octet-stream",
      new Uri.dataFromBytes([0, 1, 2], mimeType: null).data.mimeType);
}
