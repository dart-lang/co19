/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if a class declares two members of the same name.
 * @description Checks that it is a compile-time error if a class has a non-abstract instance
 * method and a static member method with the same name.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

class A {
  int func() {}
  static int func() {}
}

main() {
  try {
    A a = new A();
  } catch (e) {}
}
