/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UriData.fromBytes(
 *  List<int> bytes, {
 *  mimeType: "application/octet-stream",
 *  Map<String, String> parameters,
 *  percentEncoded: false
 *  })
 * Creates a data: URI containing an encoding of bytes.
 *
 * Equivalent to new Uri.dataFromBytes(...).data, but may be more efficient if
 * the uri itself isn't used.
 * @description Checks that this constructor creates an expected UriData. Test
 * invalid mimeType parameter specified
 * @issue 28592
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {new UriData.fromBytes([0, 1, 2], mimeType: "Text");});

  // According to the https://github.com/dart-lang/sdk/issues/28592
  // an empty MIME types should be treated as "text/plain"
  Expect.equals("text/plain",
      new UriData.fromBytes([0, 1, 2], mimeType: "").mimeType);

  // According to the https://github.com/dart-lang/sdk/issues/28592
  // null MIME types should be treated as "application/octet-stream"
  Expect.equals("application/octet-stream",
      new UriData.fromBytes([0, 1, 2], mimeType: null).mimeType);
}
