/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String path
 * read / write
 * Gets and sets the path.
 * @description Checks that this property gets and sets the path
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie.fromSetCookieValue(" cname = cval; path= / ");
  Expect.equals("/", cookie.path);

  cookie.path = "/a/b/c";
  Expect.equals("/a/b/c", cookie.path);
  cookie.path = "";
  Expect.equals("", cookie.path);
}
