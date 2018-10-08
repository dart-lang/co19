/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String domain
 * read / write
 * Gets and sets the domain.
 * @description Checks that this property gets and sets the domain. Test setting
 * unacceptable values
 * @issue 29495
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue("cn=cval; Domain=dartlang.org");
  Expect.equals("dartlang.org", cookie.domain);

  cookie.domain = " dartlang.org ";
  Expect.equals("dartlang.org", cookie.domain);
}
