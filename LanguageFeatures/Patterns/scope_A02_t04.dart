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
/// The body statement or element of a pattern-for is executed in a new scope
/// whose enclosing scope is the pattern variables' scope.
///
/// @description Checks that in a pattern-for-in element pattern variables are
/// bound in a new scope.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

const c = [[3], [4]];

main() {
  var l = [1, 2, for (var [c] in c) c, 5];
  Expect.listEquals([1, 2, 3, 4, 5], l);

  var s = {1, 2, for (var [c] in c) c, 5};
  Expect.setEquals({1, 2, 3, 4, 5}, s);

  var m = {"k1": 1, "k2": 2, for (var [c] in c) "k$c": c, "k5": 5};
  Expect.mapEquals({"k1": 1, "k2": 2, "k3": 3, "k4": 4, "k5": 5}, m);
}
