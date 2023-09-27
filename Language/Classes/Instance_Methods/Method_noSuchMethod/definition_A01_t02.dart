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

import "../../../../Utils/expect.dart";

class C1 {
  int m();
  dynamic noSuchMethod(Invocation i, [int x = 1]) {
    return x;
  }
}

class C2 {
  int m();
  dynamic noSuchMethod(Invocation i, {int x = 2}) => x;
}

main() {
  Expect.equals(1, C1().m());
  Expect.equals(2, C2().m());
}
