/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion In legacy mode, an override of operator== with no explicit
 * parameter type inherits the parameter type of the overridden method if any
 * override of operator== between the overriding method and Object.== has an
 * explicit parameter type. Otherwise, the parameter type of the overriding
 * method is dynamic.
 *
 * @description Checks that in legacy mode, an override of operator== with no
 * explicit parameter type inherits the parameter type of the overridden method
 * if any override of operator== between the overriding method and Object.== has
 * an explicit parameter type
 * @author sgrekhov@unipro.ru
 * @issue 41283
 */
// @dart=2.6
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class A {
  bool operator ==(covariant A other) => true;
}

class C extends A {
  bool operator ==(other) => true;
}

main() {
  C c = new C();
  A a = new A();
  c == a;
  c == "c";
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
