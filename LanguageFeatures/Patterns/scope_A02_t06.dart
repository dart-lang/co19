// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The variables defined by a pattern and its subpatterns (its
/// pattern variable set, defined above), are introduced into a scope based on
/// where the pattern appears:
/// ...
/// Pattern-for-in statement, pattern-for-in element, pattern-for statement,
/// pattern-for element: Scoping follows the normal for and for-in statement and
/// elements scoping rules where the variable (now variables) are bound in a new
/// scope for each loop iteration. All pattern variables are in the same scope.
/// They are considered initialized after the for loop initializer expression.
///
/// @description Checks that variables declared by the pattern in a for
/// element are considered initialized after ⟨forInitializerStatement⟩
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

main() {
  var list = [1, for (var [c] = [2]; c < 3; Expect.equals(3, c)) c++, 3];
  Expect.listEquals([1, 2, 3], list);

  var map = {
      "k1": 1,
      for (var [c] = [2]; c < 3; Expect.equals(3, c)) "k2": c++,
      "k3": 3
    };
  Expect.mapEquals({"k1": 1, "k2": 2, "k3": 3}, map);

  var set = {1, for (var [c] = [2]; c < 3; Expect.equals(3, c)) c++, 3};
  Expect.setEquals({1, 2, 3}, set);
}
