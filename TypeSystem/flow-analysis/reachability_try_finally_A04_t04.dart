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
/// @description Checks that if a type `T` is made a type of interest in `B2`
/// then it can be promoted `after(N)`.
/// @author sgrekhov22@gmail.com

class S {}

class T extends S {
  int answer() => 42;
}

class C {
  T v;
  C(this.v);
}

test1() {
  S s = S();
  try {
  } finally {
    if (s is T) {} // Make `T` a type of interest
  }
  s = T();
  s.answer();
}

test2() {
  S s = S();
  try {
  } finally {
    if (s is T) {}
  }
  (s,) = (T(),);
  s.answer();
}

test3() {
  S s = S();
  try {
  } finally {
    if (s is T) {}
  }
  C(v: s) = C(T());
  s.answer();
}

main() {
  test1();
  test2();
  test3();
}
