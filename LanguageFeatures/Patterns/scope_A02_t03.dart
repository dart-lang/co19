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
/// @description Checks that variables declared by the pattern in a pattern-for
/// statement are considered initialized after the for loop initializer
/// expression
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=patterns

main() {
  for (var [c] = [1]; c < 2; Expect.equals(2, c)) {
    Expect.equals(1, c);
    c++;
  }
}
