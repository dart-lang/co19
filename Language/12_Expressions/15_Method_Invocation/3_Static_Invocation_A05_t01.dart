/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static type warning if the type F of C.m
 * may not be assigned to a function type.
 * @description Checks that it is a static type warning if the type of
 * C.m can not be assigned to a function type.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

class C {
  static int m;
}

main() {
  try {
    C.m(); /// static type warning
    Expect.fail("NoSuchMethodError expected.");
  } on NoSuchMethodError catch(e) {}
}
