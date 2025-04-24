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
/// some promoted variable is captured in `B2` then it is demoted `after(N)`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1(int? n) {
  if (n != null) {  // `n` promoted to `int`
    try {
    } finally {
      () {n = 42;}; // `n` demoted to `int?`
    }
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test2(int? n) {
  if (n != null) {
    try {
    } finally {
      () {(n,) = (42,);};
    }
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test3(int? n) {
  if (n != null) {
    try {
    } finally {
      () {(x: n) = (x: 42);};
    }
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test4(int? n) {
  if (n != null) {
    try {
    } finally {
      () {C(v: n) = C(42);};
    }
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
