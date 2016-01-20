/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let Sstatic be the superclass of the immediately enclosing class.
 * ...
 * If Sstatic.m exists, it is a static type warning if the type F of
 * Sstatic.m may not be assigned to a function type.
 * @description Checks that it is a static type warning if S.m can not be
 * assigned to a function type.
 * @static-warning
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../../Utils/expect.dart';

class S {
  int m;
}

class A extends S {
  test() {
    try {
      super.m(); /// static type warning
      Expect.fail("NoSuchMethodError is expected");
    } on NoSuchMethodError catch (e) {}
  }
}

main() {
  new A().test();
}
