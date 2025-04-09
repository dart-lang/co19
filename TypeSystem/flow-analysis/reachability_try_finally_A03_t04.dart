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
/// some variable is assigned in `B2` but `B2` throws then it is definitely
/// assigned in dead code `after(N)`.
/// @author sgrekhov22@gmail.com
/// @issue 60503

class C {
  int v;
  C(this.v);
}

Never foo() => throw "Never";

test1() {
  int i;
  try {
  } finally {
    foo();
    i = 42;
  }
  i; // Definitely assigned and dead code
}

test2(Never n) {
  int i;
  try {
  } finally {
    n;
    (i,) = (42,);
  }
  i;
}

test3<T extends Never>(T n) {
  int i;
  try {
  } finally {
    n;
    (x: i) = (x: 42);
  }
  i;
}

test4() {
  int i;
  try {
  } finally {
    foo();
    C(v: i) = C(42);
  }
  i;
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
