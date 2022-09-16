// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Test equality of function and methods tearoffs.
/// https://github.com/dart-lang/language/issues/1712
///
/// @description Checks equality of generic mixin methods tearoffs
/// @author sgrekhov@unipro.ru

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
  <X extends num>(X x) {
    A a = new A();
    AM<X> am = new AM<X>();

    var s1 = a.mixedInSuperMethod<X>;
    var s2 = a.mixedInSuperMethod<X>;
    var s3 = am.tearoffSuperMethod;
    var s4 = am.tearoffSuperMethod;

    Expect.equals(s1, s2);
    Expect.notEquals(s1, s3);
    Expect.notEquals(s2, s3);
    Expect.equals(s3, s4);
    Expect.equals(0, s1(x));
    Expect.equals(1, s3(x));

    A a1 = new AM<X>();
    var s5 = a1.mixedInSuperMethod<X>;
    Expect.equals(s5, a1.mixedInSuperMethod<X>);
    Expect.approxEquals(1, s5(x));
  }<int>(0);
}
