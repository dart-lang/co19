// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of non-generic mixin methods tearoffs
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A {
  int mixedInSuperMethod() => 0;
}

mixin M on A {
  void mixedInMethod() {}
  int mixedInSuperMethod() => super.mixedInSuperMethod() + 1;
}

class AM extends A with M {
  int Function() get tearoffSuperMethod => super.mixedInSuperMethod;
}

main() {
  A a = new A();
  AM am = new AM();

  var s1 = a.mixedInSuperMethod;
  var s2 = a.mixedInSuperMethod;
  var s3 = am.tearoffSuperMethod;
  var s4 = am.tearoffSuperMethod;

  Expect.equals(s1, s2);
  Expect.notEquals(s1, s3);
  Expect.notEquals(s2, s3);
  Expect.equals(s3, s4);
  Expect.equals(0, s1());
  Expect.equals(1, s3());

  A a1 = new AM();
  var s5 = a1.mixedInSuperMethod;
  Expect.equals(s5, a1.mixedInSuperMethod);
  Expect.equals(1, s5());
}
