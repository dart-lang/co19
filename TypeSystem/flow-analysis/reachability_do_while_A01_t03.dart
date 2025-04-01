// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion do while statement: If `N` is a do while statement of the form
/// `do S while (E)` then:
/// - Let `before(S) = conservativeJoin(before(N), assignedIn(N), capturedIn(N))`.
/// - Let `before(E) = join(after(S), continue(N))`
/// - Let `after(N) = join(false(E), break(S))`
///
/// @description Checks that if a variable is captured in `S` then it is
/// detected by flow analysis of `S`.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1(int? n) {
  if (n != null) { // promoted to `int`
    do {
      () {
        n = 42; // demoted to `int?`
      };
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    } while (false);
  }
}

test2(int? n) {
  if (n != null) { // promoted to `int`
    do {
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
      late int i = (n = 42); // demoted to `int?`
    } while (false);
  }
}

test3(int? n) {
  if (n != null) { // promoted to `int`
    do {
      () {
        (n,) = (42,); // demoted to `int?`
      };
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    } while (false);
  }
}

test4(int? n) {
  if (n != null) { // promoted to `int`
    do {
      () {
        (x: n) = (x: 42); // demoted to `int?`
      };
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    } while (false);
  }
}

test5(int? n) {
  if (n != null) { // promoted to `int`
    do {
      () {
        C(v: n) = C(42); // demoted to `int?`
      };
      n.isEven;
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    } while (false);
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
}
