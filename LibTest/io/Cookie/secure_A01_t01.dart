/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool secure
 * read / write
 * Gets and sets whether this cookie is secure.
 * @description Checks that this property gets and sets whether this cookie is
 * secure
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue("cn=cval;");
  Expect.isFalse(cookie.secure);

  cookie = new Cookie.fromSetCookieValue("cn=cval; Secure");
  Expect.isTrue(cookie.secure);

  cookie.secure = false;
  Expect.isFalse(cookie.secure);
  Expect.equals(-1, cookie.toString().toLowerCase().indexOf("secure"));

  cookie.secure = true;
  Expect.isTrue(cookie.secure);
  Expect.isTrue(cookie.toString().toLowerCase().indexOf("secure") > 0);
}
