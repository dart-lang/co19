/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of i is:
 * • The declared return type of Sstatic.m, if Sstatic has an accessible
 *   instance getter named m.
 * • The static type of function Sstatic.m if Sstatic has an accessible
 *   instance method named m.
 * • The type dynamic otherwise.
 * @description Check that static type of the extracted method is dynamic
 * if no member named m found.
 * @static-clean
 * @author sgrekhov@unipro.ru
 */
class B {
}

@proxy class A {
}

class C extends A {
  void test() {
    try {
      B i = super.m;  // Here we expect that static type of super.m is dynamic.
                      // Dynamic can be assigned to B without static warning.
    } on NoSuchMethodError {}
  }
}

main() {
  C c = new C();
  c.test();
}
