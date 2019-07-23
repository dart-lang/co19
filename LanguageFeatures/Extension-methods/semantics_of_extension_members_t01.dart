/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Even though you can access this, you cannot use super inside an
 * extension method.
 *
 * @description Check that it is a compile error to access super inside an
 * extension method
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

class A {
  String get a => "a";
}

class C extends A {
  String get c => "c";
}

extension ExtendedC on C {
  String m() => super.a;          //# 01: compile-time error
  String get getter => super.a;   //# 02: compile-time error
  String operator-() => super.a;  //# 03: compile-time error
}

main() {
  new C();
}
