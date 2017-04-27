/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Cookie.fromSetCookieValue(String value)
 * Creates a new cookie by parsing a header value from a 'set-cookie' header.
 * @description Checks that this constructor creates a new cookie by parsing a
 * header value from a 'set-cookie' header
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

check(String headerValue, String expectedName, String expectedValue) {
  Cookie cookie = new Cookie.fromSetCookieValue(headerValue);
  Expect.equals(expectedName, cookie.name);
  Expect.equals(expectedValue, cookie.value);
}

main() {
  check("cname=b", "cname", "b");
  check("mykey=myvalue; expires=Mon, 17-Jul-2017 16:06:00 GMT; " +
      "Max-Age=31449600; Path=/; secure", "mykey", "myvalue");
  check("mykey=myvalue; Domain=dartlang.org", "mykey", "myvalue");
  check("mykey=myvalue; HttpOnly", "mykey", "myvalue");
  check("mykey=myvalue; SameSite=Strict", "mykey", "myvalue");
  check("mykey=myvalue; SameSite=Lax", "mykey", "myvalue");
  check(" cname = b ", "cname", "b");
  check(" mykey = myvalue ; HttpOnly", "mykey", "myvalue");
}
