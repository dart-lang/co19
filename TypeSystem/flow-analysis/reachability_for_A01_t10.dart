// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion for statement: If `N` is a for statement of the form
/// `for (D; C; U) S,` then:
/// - Let `before(D) = before(N)`.
/// - Let `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`
/// - Let `before(S) = split(true(C))`.
/// - Let `before(U) = merge(after(S), continue(S))`.
/// - Let `after(N) = inheritTested(join(false(C), unsplit(break(S))), after(U))`
///
/// @description Checks that
/// `before(C) = conservativeJoin(after(D), assignedIn(N), capturedIn(N))`. Test
/// that `capturedIn(C)` is detected by flow analysis.
/// @author sgrekhov22@gmail.com

class C {
  int v;
  C(this.v);
}

test1(int? n) {
  if (n != null) {
    // n promoted to `int`
    for (
      ;
      () {
        late int? i = (n = 42); // n demoted to `int?`
        return false;
      }();
    ) {}
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test2(int? n) {
  if (n != null) {
    [
      for (
        ;
        () {
          late int? i = (n = 42);
          return false;
        }();
      )
        0,
      n.isEven,
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
  }
}

test3(int? n) {
  if (n != null) {
    <Object, int>{
      for (
        ;
        () {
          late int? i = (n = 42);
          return false;
        }();
      )
        0: 0,
      n.isEven: 0,
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

test4(int? n) {
  if (n != null) {
    <int, Object>{
      for (
        ;
        () {
          late int? i = (n = 42);
          return false;
        }();
      )
        0: 0,
      0: n.isEven,
//         ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

test5(int? n) {
  if (n != null) {
    // n promoted to `int`
    for (
    ;
    () {
      late (int?,) i = ((n,) = (42,));
      return false;
    }();
    ) {}
    n.isEven;
//    ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

test6(int? n) {
  if (n != null) {
    [
      for (
      ;
      () {
        late ({int? x}) i = ((x: n) = (x: 42));
        return false;
      }();
      )
        0,
      n.isEven,
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    ];
  }
}

test7(int? n) {
  if (n != null) {
    <Object, int>{
      for (
      ;
      () {
        late C? i = (C(v: n) = C(42));
        return false;
      }();
      )
        0: 0,
      n.isEven: 0,
//      ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

main() {
  print(test1);
  print(test2);
  print(test3);
  print(test4);
  print(test5);
  print(test6);
  print(test7);
}
