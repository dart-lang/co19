// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion try catch finally: If `N` is a try/catch/finally statement of the
/// form `try B1 alternatives finally F` then:
/// - Let `before(B1) = before(N)`
/// - Let `before(Si) = join(after(B1), conservativeJoin(before(N),
///     assignedIn(B1), capturedIn(B1)))`, where `Si`
///   is the body of the i'th alternative
/// - Let
///   `after(N) = join(attachFinally(after(B1), before(F), after(F)), M1 .. Mk)`
///   where `Mj = attachFinally(after(Sj), before(F), after(F))`
///
/// @description Checks that if a type `T` is made a type of interest in `B1`
/// then it cannot be promoted in `Si`, `F` and `after(N)`.
/// @author sgrekhov22@gmail.com
/// @issue 60519

// TODO (sgrekhov) https://github.com/dart-lang/language/issues/4328

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
    if (s is T) {}
  } catch (_) {
    s = T();
    s.answer();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  } finally {
  }
}

test2() {
  S s = S();
  try {
    if (s is T) {}
  } catch (_) {
  } finally {
    (x: s) = (x: T());
    s.answer();
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test3() {
  S s = S();
  try {
    if (s is T) {}
  } catch (_) {
  } finally {
  }
  C(v: s) = C(T());
  s.answer(); // ??? Error or not? https://github.com/dart-lang/language/issues/4328
}

main() {
  print(test1);
  print(test2);
  print(test3);
}
