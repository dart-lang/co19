/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool httpOnly
 * read / write
 * Gets and sets whether this cookie is HTTP only.
 * @description Checks that this property gets and sets whether this cookie is
 * HTTP only
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue("cn=cval;");
  Expect.isFalse(cookie.httpOnly);

  cookie = new Cookie.fromSetCookieValue("cn=cval; HttpOnly");
  Expect.isTrue(cookie.httpOnly);

  cookie.httpOnly = false;
  Expect.isFalse(cookie.httpOnly);
  Expect.equals(-1, cookie.toString().toLowerCase().indexOf("httponly"));

  cookie.httpOnly = true;
  Expect.isTrue(cookie.httpOnly);
  Expect.isTrue(cookie.toString().toLowerCase().indexOf("httponly") > 0);
}
