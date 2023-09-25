// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let C be a concrete class, let L be the library that contains the
/// declaration C, L, m of C, and let m be a name. Then m is noSuchMethod
/// forwarded in C iff one of the following is true:
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
/// @description Checks that it is a compile-time error if class or enum doesn't
/// have a non-trivial `noSuchMethod` instance and has a member without an
/// implementation
/// @author sgrekhov22@gmail.com

abstract mixin class A {
  String a();
}

mixin class B {
  noSuchMethod(Invocation i) => "B";
}

abstract class D {
  String d();
  noSuchMethod(Invocation i) => "D";
}

class C1 implements D {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 implements A, B {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M1 on A implements B {}

class MA1 = A with M1;
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

enum E1 implements D {
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1, e2;
}

enum E2 implements A, B {
//   ^^
// [analyzer] unspecified
// [cfe] unspecified
  e1, e2;
}

main() {
  print(C1);
  print(E1);
}
