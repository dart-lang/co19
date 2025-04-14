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
/// @description Checks that if a type `T` is made a type of interest in `B1`
/// then it can be promoted in `B1`, `B2` and `after(N)`.
/// @author sgrekhov22@gmail.com
/// @issue 60519

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
    if (s is T) {}  // make `T` a type of interest
    s = T();
    s.answer();
  } finally {
  }
}

test2() {
  S s = S();
  try {
    if (s is T) {}
  } catch (_) {
    (s,) = (T(),);
    s.answer();
  } finally {
  }
}

test3() {
  S s = S();
  try {
    if (s is T) {}
  } catch (_) {
  } finally {
    (x: s) = (x: T());
    s.answer();
  }
}

test4() {
  S s = S();
  try {
    if (s is T) {}
  } catch (_) {
  } finally {
  }
  C(v: s) = C(T());
  s.answer();
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
