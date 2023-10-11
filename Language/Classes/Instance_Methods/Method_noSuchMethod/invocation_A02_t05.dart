// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A noSuchMethod forwarder is a concrete member of C with the
/// signature taken from the interface of C, and with the same default value for
/// each optional parameter. It can be invoked in an ordinary invocation and in
/// a superinvocation, and when m is a method it can be closurized using a
/// property extraction.
///
/// @description Checks that when a `noSuchMethod` forwarder is a setter it
/// cannot be closurized using a property extraction
/// @author sgrekhov22@gmail.com

mixin class A {
  void set m(int v);

  dynamic noSuchMethod(Invocation inv) {
    return 42;
  }
}

class C1 extends A {}

class C2 with A {}

mixin M on A {}

class MA = A with M;

enum E with A {
  e1, e2;
}

main() {
  var a1 = A().m;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  var c1 = C1().m;
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  var c2 = C2().m;
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  var m1 = MA().m;
//              ^
// [analyzer] unspecified
// [cfe] unspecified

  var e1 = E.e1.m;
//              ^
// [analyzer] unspecified
// [cfe] unspecified
}
