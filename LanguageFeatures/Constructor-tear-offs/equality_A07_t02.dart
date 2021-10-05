// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of generic mixin methods tearoffs
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class A {
  T mixedInSuperMethod<T extends num>(T t) => t;
}

mixin M on A {
  void mixedInMethod<T>() {}
  T mixedInSuperMethod<T extends num>(T t) => super.mixedInSuperMethod<T>(t) + 1 as T;
}

class AM<T extends num> extends A with M {
  T Function(T t) get tearoffSuperMethod => super.mixedInSuperMethod<T>;
}

main() {
  A a = new A();
  AM<int> am = new AM<int>();

  var s1 = a.mixedInSuperMethod<int>;
  var s2 = a.mixedInSuperMethod<int>;
  var s3 = am.tearoffSuperMethod;
  var s4 = am.tearoffSuperMethod;

  Expect.equals(s1, s2);
  Expect.notEquals(s1, s3);
  Expect.notEquals(s2, s3);
  Expect.equals(s3, s4);
  Expect.equals(0, s1(0));
  Expect.equals(1, s3(0));

  A a1 = new AM<double>();
  var s5 = a1.mixedInSuperMethod<double>;
  Expect.equals(s5, a1.mixedInSuperMethod<double>);
  Expect.approxEquals(4.14, s5(3.14));
}
