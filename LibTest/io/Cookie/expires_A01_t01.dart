/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime expires
 * read / write
 * Gets and sets the expiry date.
 * @description Checks that this property gets and sets the expiry date
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue("mykey = myvalue; " +
      "expires = Mon, 17-Jul-2017 16:06:00 GMT;");
  DateTime expected = new DateTime.utc(2017, 7, 17, 16, 6, 0, 0, 0);
  Expect.equals(expected, cookie.expires);

  DateTime newDate = new DateTime.utc(2017, 7, 18, 16, 6, 0, 0, 0);
  cookie.expires = newDate;
  Expect.equals(newDate, cookie.expires);
  Expect.equals("2017-07-18 16:06:00.000Z", cookie.expires.toString());
}
