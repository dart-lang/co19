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
/// @description Checks that if some variable is assigned in dead code in `Si`
/// then it is definitely unassigned `after(N)`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  late int i;
  try {
  } catch (_) {
    if (false) {
      i = 42;
    }
  } finally {
  }
  i; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  late int i;
  try {
  } catch (_) {
    if (false) {
      (i,) = (42,);
    }
  } finally {
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test3() {
  late int i;
  try {
  } catch (_) {
    if (false) {
      (x: i) = (x: 42);
    }
  } finally {
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test4() {
  late int i;
  try {
  } catch (_) {
    if (false) {
      C(v: i) = C(42);
    }
  } finally {
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
