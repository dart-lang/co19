// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion try finally: If `N` is a try/finally statement of the form
/// `try B1 finally B2` then:
/// - Let `before(B1) = split(before(N))`
/// - Let `before(B2) = split(join(drop(after(B1)),
///     conservativeJoin(before(N), assignedIn(B1), capturedIn(B1))))`
/// - Let `after(N) = restrict(after(B1), after(B2), assignedIn(B2))`
///
/// @description Checks that
/// `after(N) = restrict(after(B1), after(B2), assignedIn(B2))`. Test that if
/// some variable is assigned in `B1` then it is definitely assigned `after(N)`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  int i;
  try {
    i = 42;
  } finally {
  }
  i; // Definitely assigned
}

test2() {
  int i;
  try {
    (i,) = (42,);
  } finally {
  }
  i;
}

test3() {
  int i;
  try {
    (x: i) = (x: 42);
  } finally {
  }
  i;
}

test4() {
  int i;
  try {
    C(v: i) = C(42);
  } finally {
  }
  i;
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
