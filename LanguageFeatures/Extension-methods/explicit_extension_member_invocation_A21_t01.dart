/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This means that you cannot do cascade invocations on explicit
 * extension applications: E(e)..foo()..bar() is a compile-time error. This is
 * necessary because that expression evaluates to the value of E(e), and an
 * extension application does not have a value.
 *
 * @description Check that cascade invocations cannot be applied to explicit
 * extension invocation
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class C {
}

extension Ext on C {
  int foo() => 42;
  int bar() => 43;
}

main() {
  C c = C();
  Ext(c)
    ..foo()
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
    ..bar();
//  ^^
// [analyzer] unspecified
// [cfe] unspecified
}
