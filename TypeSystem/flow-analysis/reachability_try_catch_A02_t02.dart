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
/// @description Checks that
/// `after(N) = join(after(B), after(C0), ..., after(Ck))`. Test that if some
/// variable is assigned in `Si` then it is "possibly assigned" `after(N)`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1() {
  late int i;
  try {
  } on Exception catch (_) {
    i = 42;
  }
  i; // Possibly assigned
}

test2() {
  late int i;
  try {
  } on Exception catch (_) {
    (i,) = (42,);
  }
  i;
}

test3() {
  late int i;
  try {
  } on Exception catch (_) {
    (x: i) = (x: 42);
  }
  i;
}

test4() {
  late int i;
  try {
  } on Exception catch (_) {
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
