/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int maxAge
 * read / write
 * Gets and sets the max age. A value of 0 means delete cookie now.
 * @description Checks that this property gets and sets the max age
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue("cn=cval; Max-Age=31449600");
  Expect.equals(31449600, cookie.maxAge);

  cookie.maxAge = 10;
  Expect.equals(10, cookie.maxAge);

  cookie.maxAge = 0;
  Expect.equals(0, cookie.maxAge);

  cookie.maxAge = -10;
  Expect.equals(-10, cookie.maxAge);
}
