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
/// @description Checks that if a type `T` is made a type of interest in `B`
/// then it can be promoted in `Si` and `after(N)`.
/// @author sgrekhov22@gmail.com
/// @issue 60519

// TODO (sgrekhov) https://github.com/dart-lang/language/issues/4328

class S {}

class T extends S {
  int answer() => 42;
}

test1() {
  S s = S();
  try {
    if (s is T) {} // make `T` a type of interest
  } on Exception catch (_) {
    s = T();
    s.answer();
  }
}

test2() {
  S s = S();
  try {
    if (s is T) {}
  } catch (_) {
  }
  s = T();
  s.answer();
}

main() {
  test1();
  test2();
}
