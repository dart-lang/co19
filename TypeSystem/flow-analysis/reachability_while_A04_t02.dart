// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion while statement: If `N` is a while statement of the form
/// `while (E) S` then:
/// - Let `before(E) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(E))`.
/// - Let `after(N) = inheritTested(join(false(E), unsplit(break(S))), after(S))`
///
/// @description Checks that if a promoted variable is captured in `E` it is
/// demoted in `S`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1(int? n) {
  if (n != null) { // `n` promoted to `int`
    while ((){n = 42; return false;}()) { // `n` demoted to `int?`
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

test2(int? n) {
  if (n != null) {
    while ((){(n,) = (42,); return false;}()) {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

test3(int? n) {
  if (n != null) {
    while ((){(x: n) = (x: 42); return false;}()) {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

test4(int? n) {
  if (n != null) {
    while ((){C(v: n) = C(42); return false;}()) {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
}
