// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion switch statement: If `N` is a switch statement of the form
/// `switch (E) {alternatives}` then:
/// - Let `before(E) = before(N)`.
/// - For each `C` in `alternatives` with statement body `S`:
///   - If `C` is labelled let
///     `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
///     otherwise let `before(S) = after(E)`.
///  - If the cases are exhaustive, then let `after(N) = break(N)` otherwise let
///    `after(N) = join(after(E), break(N))`.
///
/// @note As of May 2025 there is no corresponding spec paragraph about switch
/// expressions or switch statements using patterns. Therefore the old version
/// of the spec is used.
///
/// @description Checks that if a variable is initialized in a `when` part of a
/// `case` statement then this variable is possibly assigned.
/// @author sgrekhov22@gmail.com

void test1() {
  late int i;
  switch (42) {
    case String _ when (i = 42) > 0:
  }
  i; // Possibly assigned
}

void test2() {
  late int i;
  switch (42) {
    label: case int _ when (i = 42) > 0:
  }
  i;
}

main() {
  print(test1);
  print(test2);
}
