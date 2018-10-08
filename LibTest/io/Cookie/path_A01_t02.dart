/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * read / write
 * Gets and sets the path.
 * @description Checks that this property gets and sets the path. Test
 * unacceptable values
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue(" cname = cval; path= / ");
  Expect.equals("/", cookie.path);

  Expect.throws(() {cookie.path = " /a/b/c:/ ";});
}
