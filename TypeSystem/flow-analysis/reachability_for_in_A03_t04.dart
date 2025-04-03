// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for each statement: If `N` is a for statement of the form
/// `for (T X in E) S`, `for (var X in E) S`, or `for (X in E) S`, then:
/// - Let `before(E) = before(N)`
/// - Let `before(S) = conservativeJoin(after(E), assignedIn(N), capturedIn(N))`
/// - Let `after(N) = join(before(S), break(S))`
///
/// @description Checks that `after(N) = join(before(S), break(S))`. Test that
/// if `E` is an empty collection literal then an assignment in `S` before the
/// `break` statement is treated by flow analysis as possibly assigned.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  late int i;
  if (2 > 1) {
    for (var j in []) {
      i = 42;
      break;
    }
  }
  i; // Possibly assigned.
}

test2() {
  late int i;
  if (2 > 1) {
    for (var j in []) {
      (i,) = (42,);
      break;
    }
  }
  i;
}

test3() {
  late int i;
  if (2 > 1) {
    for (var j in []) {
      (x: i) = (x: 42);
      break;
    }
  }
  i;
}

test4() {
  late int i;
  if (2 > 1) {
    for (var j in []) {
      C(v: i) = C(42);
      break;
    }
  }
  i;
}

test5() {
  late int i;
  if (2 > 1) {
    for (var j in {}) {
      i = 42;
      break;
    }
  }
  i;
}

test6() {
  late int i;
  if (2 > 1) {
    for (var j in {}) {
      (i,) = (42,);
      break;
    }
  }
  i;
}

test7() {
  late int i;
  if (2 > 1) {
    for (var j in {}) {
      (x: i) = (x: 42);
      break;
    }
  }
  i;
}

test8() {
  late int i;
  if (2 > 1) {
    for (var j in {}) {
      C(v: i) = C(42);
      break;
    }
  }
  i;
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
  print(test7);
  print(test8);
}
