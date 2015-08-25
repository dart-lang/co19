/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A case clause introduces a new scope, nested in the lexically surrounding scope.
 * The scope of a case clause ends immediately after the case clause’s statement list.
 * @description Checks that the scope of a case clause ends immediately after the case
 * clause’s statement list.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  try {
    switch(2) {
      case 1: var x = 2;
              break;
      case 2: x++; /// static type warning x isn't declared in this scope
    }
    Expect.fail("NoSuchMethodError expected when calling undefined getter.");
  } on NoSuchMethodError catch (ex) {}
}
