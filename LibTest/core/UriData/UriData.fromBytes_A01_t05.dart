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
 * percentEncoded argument specified
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "../Uri/UriDataEncoder.lib.dart";

main() {
  List<int> bytes = [];
  for (int i = 0; i < 256; i++) {
    bytes.add(i);
  }
  UriData uriData = new UriData.fromBytes(bytes, percentEncoded: true);

  Expect.equals(encodeList(bytes), uriData.contentText);
  Expect.equals("application/octet-stream", uriData.mimeType);
}
