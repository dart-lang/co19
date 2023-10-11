// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A noSuchMethod forwarder is a concrete member of C with the
/// signature taken from the interface of C, and with the same default value for
/// each optional parameter. It can be invoked in an ordinary invocation and in
/// a superinvocation, and when m is a method it can be closurized using a
/// property extraction.
///
/// @description Checks that it is a compile-time error to call a `super.m()` in
/// a mixin application with a no `noSuchMethod` forwarder
/// @author sgrekhov22@gmail.com

mixin class A {
  int m1(int v, [covariant String s = "s1"]);

  int m2(int v, {covariant String s = "s2"});

  dynamic noSuchMethod(Invocation inv) {
    return 42;
  }
}

class C with A {
  test() {
    super.m1(1, "1");
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
    super.m2(1, s: "1");
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

enum E with A {
  e1, e2;
  test() {
    super.m1(1, "1");
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
    super.m2(1, s: "1");
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(E);
}
