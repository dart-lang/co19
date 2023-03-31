// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A pattern on the left side of an assignment expression is used to
/// destructure the assigned value. We extend expression:
///
/// expression        ::= patternAssignment
///                     | // Existing productions...
///
/// patternAssignment ::= outerPattern '=' expression
/// ...
/// We could allow assigning to other variables or setters, but it seems strange
/// to allow assigning to foo when foo is an instance field on the surrounding
/// class with an implicit this., but not allowing to assign to this.foo
/// explicitly. In the future, we may expand pattern assignment syntax to allow
/// other selector expressions. For now, we restrict assignment to local
/// variables, which are also the only kind of variables that can be declared by
/// patterns.
///
/// @description Check that it is a compile-time error if an identifier in a
/// variable pattern assigns a class member
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "patterns_lib.dart";

class C {
  int a = 42;
  Record r = ();
  List<int> l = [];
  int areaAsInt = 42;
}

main() {
  C c = C();
  Record rl = ();
  int bl = 42;

  ((c.a, _) && rl) = (1, 2);
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  ((bl, _) && c.r) = (1, 2);
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [c.a, _] = [1, 2];
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  [a, ...c.l] = [1, 2];
//       ^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": c.a, "key2": _} = {"key1": 1, "key2": 2};
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  {"key1": c.a} = {"key1": 1, "key2": 2};
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (c.a, _) = (1, 2);
// ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (n1: c.a, _) = (n1: 1, 2);
//     ^^^
// [analyzer] unspecified
// [cfe] unspecified

  (:c.a, _) = (a: 1, 2);
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Square(areaAsInt: c.a) = Square(1);
//                  ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
