/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Cookie([String name, String value])
 * Creates a new cookie optionally setting the name and value.
 * By default the value of httpOnly will be set to true.
 * @description Checks that this constructor creates a new Cookie object. Test
 * default parameters
 * @issue 29463
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Cookie cookie = new Cookie();
  Expect.isNull(cookie.name);
  Expect.isNull(cookie.value);
  Expect.isTrue(cookie.httpOnly);
}
