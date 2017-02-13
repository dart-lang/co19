/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String mimeType
 * The MIME type of the data URI.
 * A data URI consists of a "media type" followed by data. The media type starts
 * with a MIME type and can be followed by extra parameters.
 * @description Checks that this property returns a MIME type
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("text/plain",
      UriData.parse("data:text/plain,some data").mimeType);
  Expect.equals("image/gif",
      UriData.parse("data:image/gif,some data").mimeType);
  Expect.equals("a/b", UriData.parse("data:a/b,some data").mimeType);
  Expect.equals(" a / b ", UriData.parse("data: a / b ,some data").mimeType);
  Expect.equals(" й / ф ",
      UriData.parse("data:%20%D0%B9%20/%20%D1%84%20,some data").mimeType);

  Expect.equals("text/plain", new UriData.fromString("some data").mimeType);
  Expect.equals("image/gif", new UriData.fromString("some data",
      mimeType: "image/gif").mimeType);
  Expect.equals(" A / B ", new UriData.fromString("some data",
      mimeType: " A / B ").mimeType);
  Expect.equals(" Й / Ф ", new UriData.fromString("some data",
      mimeType: " Й / Ф ").mimeType);
}
