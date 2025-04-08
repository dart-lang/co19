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
/// promoted variable is captured in `B` then it is demoted in `after(N)`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1(int? n) {
  if (n != null) {  // `n` promoted to `int`
    try {
      () {n = 42;}; // `n` demoted to `int?`
    } on Exception catch (_) {}
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test2(int? n) {
  if (n != null) {
    try {
      () {(n,) = (42,);};
    } on Exception catch (_) {}
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test3(int? n) {
  if (n != null) {
    try {
      () {(x: n) = (x: 42);};
    } on Exception catch (_) {}
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test4(int? n) {
  if (n != null) {
    try {
      () {C(v: n) = C(42);};
    } on Exception catch (_) {}
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
