/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Unless explicitly stated otherwise, all ordinary rules that apply
 * to methods apply to abstract methods.
 * It is a static warning if an instance method m1 overrides an instance member
 * m2 and m1 has a greater number of required parameters than m2.
 * @description Checks that a compile error is produced when an abstract
 * method overrides a non-abstract instance method with the same name and
 * greater number of required parameters. Test type aliases
 * @compile-error
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=nonfunction-type-aliases

class A {
  f(var x) {}
}
typedef AAlias = A;

abstract class C extends AAlias {
  f(var x, var y);
}
typedef CAlias = C;

class D extends CAlias {
  f(var x, var y) {}
}

main() {
  new A().f(2);
  new D().f(2, 2);
}

