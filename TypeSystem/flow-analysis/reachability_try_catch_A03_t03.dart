// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion try catch: If `N` is a try/catch statement of the form
/// `try B alternatives` then:
/// - Let `before(B) = before(N)`
/// - For each catch block on `Ti Si` in alternatives:
///   - Let
///     `before(Si) = conservativeJoin(before(N), assignedIn(B), capturedIn(B))`
/// - Let `after(N) = join(after(B), after(C0), ..., after(Ck))`
///
/// @description Checks that if a type `T` is made a type of interest in
/// `alternatives` then it can be promoted in `alternatives` and `after(N)`.
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
  try {} catch (_) {
    if (s is T) {} // make `T` a type of interest
    s = T();
    s.answer();
  }
}

test2() {
  S s = S();
  try {
  } on Exception catch (_) {
    if (s is T) {}
  } catch (_) {
    (s,) = (T(),);
    s.answer();
  }
}

test3() {
  S s = S();
  try {
  } on Exception catch (_) {
    if (s is T) {}
  }
  C(v: s) = C(T());
  s.answer();
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
