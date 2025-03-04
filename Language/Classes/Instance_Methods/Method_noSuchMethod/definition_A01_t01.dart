// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a class C has a non-trivial `noSuchMethod` if C has a
/// concrete member named noSuchMethod which is distinct from the one declared
/// in the built-in class [Object]
///
/// Note that it must be a method that accepts one positional argument, in order
/// to correctly override noSuchMethod in Object. For instance, it can have
/// signature noSuchMethod(Invocation i) or
/// noSuchMethod(Object i, [String s = ”]), but not
/// noSuchMethod(Invocation i, String s). This implies that the situation  where
/// noSuchMethod is invoked (explicitly or implicitly) with one actual argument
/// cannot fail for the reason that “there is no such method”, such that we
/// would enter an infinite loop trying to invoke noSuchMethod. It is possible,
/// however, to encounter a dynamic error during an invocation of noSuchMethod
/// because the actual argument fails to satisfy a type check, but that
/// situation will give rise to a dynamic type error rather than a repeated
/// attempt to invoke noSuchMethod
///
/// @description Checks that it is possible to define a `noSuchMethod` which
/// is a correct override of `noSuchMethod` in `Object`.
/// @author sgrekhov22@gmail.com
/// @issue 53640

import "../../../../Utils/expect.dart";

class C1 {
  int m();
  void noSuchMethod(Invocation i) {}
}

class C2 {
  int m();
  Object? noSuchMethod(Invocation i) => 2;
}

class C3 {
  int m();
  Null noSuchMethod(Invocation i) => null;
}

class C4 {
  int m();
  Never noSuchMethod(Invocation i) => throw 42;
}

class C5 {
  int m();
  int noSuchMethod(Invocation i) => 5;
}

mixin M1 {
  int m();
  void noSuchMethod(Invocation i) {}
}

mixin M2 {
  int m();
  Object? noSuchMethod(Invocation i) => 2;
}

mixin M3 {
  int m();
  Null noSuchMethod(Invocation i) => null;
}

mixin M4 {
  int m();
  Never noSuchMethod(Invocation i) => throw 42;
}

mixin M5 {
  int m();
  int noSuchMethod(Invocation i) => 5;
}

class MA1 = Object with M1;
class MA2 = Object with M2;
class MA3 = Object with M3;
class MA4 = Object with M4;
class MA5 = Object with M5;

enum E1 {
  e1, e2;
  int m();
  void noSuchMethod(Invocation i) {}
}

enum E2 {
  e1, e2;
  int m();
  Object? noSuchMethod(Invocation i) => 2;
}

enum E3 {
  e1, e2;
  int m();
  Null noSuchMethod(Invocation i) => null;
}

enum E4 {
  e1, e2;
  int m();
  Never noSuchMethod(Invocation i) => throw 42;
}

enum E5 {
  e1, e2;
  int m();
  int noSuchMethod(Invocation i) => 5;
}

main() {
  Expect.throws(() {
    C1().m();
  });
  Expect.equals(2, C2().m());
  Expect.throws(() {
    C3().m();
  });
  Expect.throws(() {
    C4().m();
  });
  Expect.equals(5, C5().m());

  Expect.throws(() {
    MA1().m();
  });
  Expect.equals(2, MA2().m());
  Expect.throws(() {
    MA3().m();
  });
  Expect.throws(() {
    MA4().m();
  });
  Expect.equals(5, MA5().m());

  Expect.throws(() {
    E1.e1.m();
  });
  Expect.equals(2, E2.e1.m());
  Expect.throws(() {
    E3.e1.m();
  });
  Expect.throws(() {
    E4.e1.m();
  });
  Expect.equals(5, E5.e1.m());
}
