// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The variables defined by a pattern and its subpatterns (its
/// pattern variable set, defined above), are introduced into a scope based on
/// where the pattern appears:
/// ...
/// Pattern-for statement: Scoping follows the normal for and for-in statement
/// scoping rules where the variable (now variables) are bound in a new scope
/// for each loop iteration. All pattern variables are in the same scope. They
/// are considered initialized after the for loop initializer expression.
///
/// @description Checks that in a pattern-for statement pattern variables are
/// bound in a new scope
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

import "../../Utils/expect.dart";

const c = [1];

main() {
  bool visited = false;
  for (var [c] in [c]) {
    Expect.listEquals(1, c);
    visited = true;
  }
  Expect.isTrue(visited);
}
