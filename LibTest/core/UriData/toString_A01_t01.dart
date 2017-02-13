/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns a string representation of this object.
 * @description Checks that this method returns correct string representation of
 * the data URI. Test data URIs created by parse()
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

check(String uri) {
  UriData uriData = UriData.parse(uri);
  Expect.equals(uri, uriData.toString());
}

main() {
  check("data:text/plain;a=b;base64,dataaaa");
  check("data:image/gif;a=b;charset=utf-8;base64,dataaa");
  check("data:image/gif;a=b;charset=utf-8;base64,кириллица");
  check("data:;a=b;charset=utf-8;base64,кириллица");
  check("data: a / b ;a=b;charset=utf-8;base64,кириллица");
  check("data: a / b ;й=ф;charset=utf-8;base64,кириллица");
  check("data: a / b ;й=ф,кириллица");
  check("data:,");
}
