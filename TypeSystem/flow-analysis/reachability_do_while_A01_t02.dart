// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that if a variable is assigned in `S` then it is not
/// definitely unassigned in `E`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  late int i;
  do {
    i = 42;
  } while (i < 0);
}

test2() {
  late int i;
  do {
    (i,) = (42,);
  } while (i < 0);
}

test3() {
  late int i;
  do {
    (x: i) = (x: 42);
  } while (i < 0);
}

test4() {
  late int i;
  do {
    (i,) = (42,);
  } while (i < 0);
}

main() {
  test1();
  test2();
  test3();
  test4();
}
