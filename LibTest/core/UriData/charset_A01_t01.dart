/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String charset
 * The charset parameter of the media type.
 *
 * If the parameters of the media type contains a charset parameter then this
 * returns its value, otherwise it returns US-ASCII, which is the default
 * charset for data URIs.
 * @description Checks that if the parameters of the media type contains a
 * charset parameter then this property returns its value, otherwise it returns
 * US-ASCII
 * @author sgrekhov@unipro.ru
 */
import "dart:convert";
import "../../../Utils/expect.dart";

main() {
  Expect.equals("US-ASCII", UriData.parse("data:text/plain,some data").charset);
  Expect.equals("US-ASCII", UriData.parse("data:,some data").charset);
  Expect.equals("utf-8",
      UriData.parse("data:;charset=utf-8;base64,some data").charset);
  Expect.equals("utf-8",
      UriData.parse("data:;charset=utf-8,some data").charset);
  Expect.equals("US-ASCII", new UriData.fromString("some data").charset);
  Expect.equals("utf-8", new UriData.fromString("some data",
      encoding: Encoding.getByName("utf-8")).charset);
}
