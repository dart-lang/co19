/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion dynamic invalidValue
 * read-only
 * The invalid value.
 * @description Checks that invalidValue property returns the invalid value
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";
 
main() {
  var value1 = "some value";
  ArgumentError err1 = new ArgumentError.value(value1);
  Expect.equals(value1, err1.invalidValue);

  var value2 = 3.14;
  ArgumentError err2 = new ArgumentError.value(value2);
  Expect.equals(value2, err2.invalidValue);
}
