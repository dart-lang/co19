/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant variable is a variable whose declaration includes the modifier
 * const. A constant variable is always implicitly final.
 * @description Checks that a NoSuchMethodError occurs and a static warning is given
 * when a constant local variable is assigned a new value after being initialized at declaration.
 * @static-warning
 * @author msyabro
 * @reviewer iefremov
 * @issue 5885
 */
import "../../Utils/expect.dart";

main() {
  const int foo = 1;
  try {
    foo = 2; /// static warning 5_Variables_A06
    Expect.fail("NoSuchMethodError expected");
  } on NoSuchMethodError catch(ok) {}
}
