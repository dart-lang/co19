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
/// @description Checks that there is no 'noSuchMethod' forwarder if class `C`
/// is not a concrete class.
/// @author sgrekhov22@gmail.com

abstract mixin class A {
  int m1(int v, [covariant String s = "s1"]);

  int m2(int v, {covariant String s = "s2"});

  dynamic noSuchMethod(Invocation inv) {
    return 42;
  }
}

class C1 extends A {
  test() {
    super.m1(1, "1");
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
    super.m2(2, s: "2");
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class C2 with A {
  test() {
    super.m1(1, "1");
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
    super.m2(2, s: "2");
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
    super.m2(2, s: "2");
//        ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C1);
  print(C2);
  print(E);
}
