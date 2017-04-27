/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Cookie.fromSetCookieValue(String value)
 * Creates a new cookie by parsing a header value from a 'set-cookie' header.
 * @description Checks that this constructor creates a new cookie by parsing a
 * header value from a 'set-cookie' header. Test an empty cookie name
 * @issue 29492
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {new Cookie.fromSetCookieValue("=myvalue;");});
}
