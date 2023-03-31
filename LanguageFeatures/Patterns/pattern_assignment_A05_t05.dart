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
/// It is a compile-time error if:
///
/// An identifier in a variable pattern does not resolve to an assignable local
/// variable or formal parameter. A variable is assignable if it is any of:
///
/// - Non-final
/// - Final and definitely unassigned
/// - Late final and not definitely assigned
///
/// @description Check that it is no compile-time error if an identifier in a
/// variable pattern is late final and not definitely assigned
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns,records

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  var a = 42;
  (int, int) r = (0, 0);
  late final int af1, af2, af3, af4, af5, af6, af7, af8, areaAsInt;
  late final (int, int) rf;
  late final List<int> lf;

  if (1 > 2) {
    af1 = 0;
    af2 = 0;
    af3 = 0;
    af4 = 0;
    af5 = 0;
    af6 = 0;
    af7 = 0;
    af8 = 0;
    areaAsInt = 0;
    rf = (0, 0);
    lf = [0];
  }

  ((af1, _) && r) = (1, 2);
  Expect.equals(1, af1);
  Expect.equals(1, r.$1);
  Expect.equals(2, r.$2);

  ((a, _) && rf) = (1, 2);
  Expect.equals(1, a);
  Expect.equals(1, rf.$1);
  Expect.equals(2, rf.$2);

  [af2, _] = [1, 2];
  Expect.equals(1, af2);

  [a, ...lf] = [1, 2];
  Expect.equals(1, a);
  Expect.listEquals([2], lf);

  {"key1": af3, "key2": _} = {"key1": 1, "key2": 2};
  Expect.equals(1, af3);

  {"key1": af4} = {"key1": 1, "key2": 2};
  Expect.equals(1, af4);

  (af5, _)  = (1, 2);
  Expect.equals(1, af5);

  (n1: af6, _)  = (n1: 1, 2);
  Expect.equals(1, af6);

  (:af7, _)  = (af7: 1, 2);
  Expect.equals(1, af7);

  Square(areaAsInt: af8) = Square(1);
  Expect.equals(1, af8);

  Square(:areaAsInt) = Square(1);
  Expect.equals(1, areaAsInt);
}
