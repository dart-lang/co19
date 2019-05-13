/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if m is a method and m' is a getter, or
 * if m is a getter and m' is a method.
 * @description Checks that there is a compile error if class has a method
 * and its superinterface has a getter with the same name. Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases
class A {
  int get m => 0;
}

typedef AAlias = A;

class C implements AAlias {
  int m() {
    return 1;
  }
}

main() {
  C c = new C();
  c.m();
}
