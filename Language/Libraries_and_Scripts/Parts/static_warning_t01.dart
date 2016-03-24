/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the referenced part declaration p names
 * a library other than the current library as the library to which p belongs.
 * @description Checks that it is a static warning if the referenced part nemes
 * another library, but not a compile-time error and all definitions from such
 * part are available without errors.
 * @static-warning
 * @author rodionov
 * @reviewer kaigorodov
 */
library Parts_test_lib_not;
import "../../../Utils/expect.dart";
part "part_3.dart";       /// static type warning

main() {
  new A();
  value = 3;
  Expect.equals(3, value);
}
