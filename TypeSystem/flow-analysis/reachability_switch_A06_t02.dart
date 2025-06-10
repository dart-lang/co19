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
/// @description Checks that if a type `T` is made a type of interest in `E`
/// for a variable `s` then `s` can be promoted in `after(N)`.
/// @author sgrekhov22@gmail.com
/// @issue 60479
/// @issue 60539

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  switch (s is T) {
    case true:
    case false:
  }
  s = T();
  s.answer();
}

test2() {
  S s = S();
  switch (s is T ? 1 : 2) {
    label: case 1:
    case 2:
  }
  s = T();
  s.answer();
}

main() {
  test1();
  test2();
}
