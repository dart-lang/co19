// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
/// Pattern assignment
/// 1. Evaluate the right-hand side expression to a value v.
/// 2. Match v against the pattern on the left. When matching a variable pattern
///   against a value o, record that o will be the new value for the
///   corresponding variable, but do not store the variable.
/// 3. Once all destructuring and matching is done, store all of the assigned
///   variables with their corresponding values.
///
/// @description Check that if matching fails then no values are assigned
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";
import "patterns_lib.dart";

main() {
  int v1 = 42;
  Expect.throws(() {
    (v1) = (3.14) as dynamic;
  });
  Expect.equals(42, v1);

  int l1 = 42;
  int l2 = 42;
  Expect.throws(() {
    dynamic pi = 3.14;
    [l1, l2] = [0, pi];
  });
  Expect.equals(42, l1);
  Expect.equals(42, l2);

  int m1 = 42;
  int m2 = 42;
  Expect.throws(() {
    dynamic pi = 3.14;
    {"k1": m1, "k2": m2} = {"k1": 0, "k2": pi};
  });
  Expect.equals(42, m1);
  Expect.equals(42, m2);

  int r1 = 42;
  int r2 = 42;
  Expect.throws(() {
    dynamic pi = 3.14;
    (r1, r2) = (0, pi);
  });
  Expect.equals(42, r1);
  Expect.equals(42, r2);

  int o1 = 42;
  int o2 = 42;
  Expect.throws(() {
    Circle(sizeAsInt: o1, areaAsDynamicDouble: o2) = Circle(1);
  });
  Expect.equals(42, o1);
  Expect.equals(42, o2);
}
