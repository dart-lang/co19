// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Record expressions can be constant and potentially constant
/// expressions. A record expression is a compile-time constant expression if
/// and only if all its field expressions are compile-time constant expressions.
///
/// *This is true whether the expression occurs in a constant context or not,
/// which means that a record expression can be used directly as a parameter
/// default value if its record field expressions are constant expressions, as
/// in:
/// ```dart
/// void someFunction({(int, int) x = (1, 2)}) => ...`
/// ```
///
/// @description Checks that a record expression is a compile-time constant
/// expression if and only if all its field expressions are compile-time
/// constant expressions.
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

const Pi = 3.14;

const r1 = (1, [1], {2}, {"a": 0}, Pi);
const r2 = (d: Pi, l: [0], s: {1}, m: {"x": Pi});
const r3 = (name: Pi, 3.14, [1], {2}, {"a": 0});
const r4 = (const [Pi], m: const {"pi": 3.14});

void f1([(int, List<int>, Set<int>, Map<String, int>, {String n}) v =
    const (n: "", 1, [1], {2}, {"a": 0},)]) {}
void f2({(int, List<int>, Set<int>, Map<String, int>, {String n}) v =
    (n: "", 1, const [1], const {2}, const {"a": 0},)}) {}

main() {
  Expect.equals(const (1, [1], {2}, {"a": 0}, Pi), r1);
  Expect.equals((d: Pi, l: const [0], s: const {1}, m: const {"x": Pi}), r2);
  Expect.equals(const (name: Pi, 3.14, [1], {2}, {"a": 0}), r3);
  Expect.equals((const [Pi], m: const {"pi": 3.14}), r4);
  f1();
  f2();
}
