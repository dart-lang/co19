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
 * @description Checks that it is a compile error if S.m can not be
 * assigned to a function type.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 */

class S {
  int m;
}

class A extends S {
  test() {
    super.m();
  }
}

main() {
  new A().test();
}
