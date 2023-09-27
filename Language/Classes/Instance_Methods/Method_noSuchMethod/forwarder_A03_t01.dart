// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a concrete class, let L be the library that contains the
/// declaration of C, and let m be a name. Then m is noSuchMethod forwarded in C
/// iff one of the following is true:
///
/// • Requested in program: C has a non-trivial noSuchMethod, the interface of C
/// contains a member signature S named m, and C has no concrete member named m
/// and accessible to L that correctly overrides S (that is, no member named m
/// is declared or inherited by C, or one is inherited, but it does not have the
/// required signature). In this case we also say that S is noSuchMethod
/// forwarded.
///
/// • Forced by privacy: There exists a direct or indirect superinterface D of C
/// which is declared in a library L2 different from L, the interface of D
/// contains a member signature S named m, m is a private name, and no
/// superclass of C has a concrete member named m accessible to L2 that
/// correctly overrides S. In this case we also say that S is noSuchMethod
/// forwarded.
///
/// For a concrete class C, a noSuchMethod forwarder is implicitly induced for
/// each member signature which is noSuchMethod forwarded.
///
/// @description Checks that it is a compile-time error if a class has an
/// interface member `m` and doesn't have a valid concrete implementation of `m`
/// even if it has a non-trivial `noSuchMethod`
/// @author sgrekhov22@gmail.com

abstract mixin class A {
  String m([String s = ""]);
}

mixin class B {
  String m() => "B";
}

class C1 extends B implements A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) => "C1";
}

class C2 with B implements A {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
  dynamic noSuchMethod(Invocation i) => "C2";
}

mixin M on B implements A {
  dynamic noSuchMethod(Invocation i) => "M";
}

class MA = B with M;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

enum E with B implements A {
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  e1, e2;
  dynamic noSuchMethod(Invocation i) => "E";
}

main() {
  print(C1);
  print(C2);
  print(MA);
  print(E);
}
