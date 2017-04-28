/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String value
 * read / write
 * Gets and sets the value.
 * @description Checks that this property gets and sets the value
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue(" cname = cval; ");
  Expect.equals("cval", cookie.value);

  cookie.value = "cvalue 2 ";
  Expect.equals("cvalue 2 ", cookie.value);
  cookie.value = "";
  Expect.equals("", cookie.value);
}
