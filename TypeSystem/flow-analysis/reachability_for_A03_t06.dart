// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for statement: If `N` is a for statement of the form
/// `for (D; C; U) S,` then:
/// - Let `before(D) = before(N)`.
/// - Let `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(C))`.
/// - Let `before(U) = merge(after(S), continue(S))`.
/// - Let `after(N) = inheritTested(join(false(C), unsplit(break(S))), after(U))`
///
/// @description Checks that `before(U) = merge(after(S), continue(S))`. Test
/// that if `D`, `C` are empty and `S` breaks, then an assignment in `U` is
/// treated by flow analysis as 'possibly assigned`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  late int i;
  for (;; i = 42) { // Possibly assigned. https://github.com/dart-lang/sdk/issues/60320#issuecomment-2776599140
    break;
  }
  try {
    i; // Runtime error, Ok
  } catch (_) {}
}

test2() {
  late int i;
  for (;; (i,) = (42,)) {
    break;
  }
  try {
    i; // Runtime error, Ok
  } catch (_) {}
}

test3() {
  late int i;
  for (;; (x: i) = (x: 42)) {
    break;
  }
  try {
    i; // Runtime error, Ok
  } catch (_) {}
}

test4() {
  late int i;
  for (;; C(v: i) = C(42)) {
    break;
  }
  try {
    i; // Runtime error, Ok
  } catch (_) {}
}

main() {
  test1();
  test2();
  test3();
  test4();
}
