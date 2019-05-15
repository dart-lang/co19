/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile error if a getter m1 overrides a getter m2 and
 * the type of m1 is not a subtype of the type of m2.
 * @description Checks that a compile error is produced if the overridden
 * getter is implicit as the return types of both getters are not mutually 
 * assignable. Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  double n;
}
typedef AAlias = A;

class C extends AAlias {
  int get n {}
}

main() {
  new C().n;
}
