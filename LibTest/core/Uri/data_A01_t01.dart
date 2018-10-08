/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion UriData data
 * Access the structure of a data: URI.
 *
 * Returns a UriData object for data: URIs and null for all other URIs. The
 * UriData object can be used to access the media type and data of a data: URI.
 * @description Checks expected authority settings
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";

main() {
  var uri = new Uri(userInfo: 'user:pass', host: 'foo', port:123);
  Expect.isNull(uri.data);
  
  uri = new Uri.dataFromString("123");
  Expect.isNotNull(uri.data);
  checkUriData(new UriData.fromString("123"), uri.data);

  uri = new Uri.dataFromString("123", mimeType: "image/gif");
  checkUriData(new UriData.fromString("123", mimeType: "image/gif"), uri.data);

  uri = new Uri.dataFromBytes([0x12, 0x20], mimeType: "image/gif");
  checkUriData(new UriData.fromBytes([0x12, 0x20], mimeType: "image/gif"),
      uri.data);
}

checkUriData(UriData expected, UriData current) {
  Expect.equals(expected.contentText, current.contentText);
  Expect.equals(expected.charset, current.charset);
  Expect.equals(expected.mimeType, current.mimeType);
  Expect.equals(expected.uri, current.uri);
}

