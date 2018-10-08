/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string ends with [other].
 * @description Checks some basic cases
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "String";
  String end = "ng";
  Expect.isTrue(str.endsWith(end) == true);
  Expect.isTrue(str.endsWith("falseEnd") == false);
  Expect.isTrue(str.endsWith("StringString") == false);
  Expect.isTrue(str.endsWith("Strin") == false);
}
