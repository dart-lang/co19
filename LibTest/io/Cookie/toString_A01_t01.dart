/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString()
 * Returns the formatted string representation of the cookie. The string
 * representation can be used for for setting the Cookie or 'set-cookie' headers
 * @description Checks that this method returns the formatted string
 * representation of the cookie
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie("cname", "cvalue");
  Expect.equals("cname=cvalue; HttpOnly", cookie.toString());

  cookie.httpOnly = false;
  Expect.equals("cname=cvalue", cookie.toString());

  cookie.domain = "dartlang.org";
  Expect.equals("cname=cvalue; Domain=dartlang.org", cookie.toString());

  cookie.domain = null;
  cookie.secure = true;
  Expect.equals("cname=cvalue; Secure", cookie.toString());
}
