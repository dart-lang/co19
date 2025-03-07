// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator== If `N` is an expression of the form `E1 == E2`, where
/// the static type of `E1` is `T1` and the static type of `E2` is `T2`, then:
/// - Let `before(E1) = before(N)`.
/// - Let `before(E2) = after(E1)`.
/// - If `equivalentToNull(T1)` and `equivalentToNull(T2)`, then:
///   - Let `true(N) = after(E2)`.
///   - Let `false(N) = unreachable(after(E2))`.
/// - Otherwise, if `equivalentToNull(T1)` and `T2` is non-nullable, or
///   `equivalentToNull(T2)` and `T1` is non-nullable, then:
///   - Let `after(N) = after(E2)`.
/// - Otherwise, if `stripParens(E1)` is a `null` literal, then:
///   - Let `true(N) = after(E2)`.
///   - Let `false(N) = promoteToNonNull(E2, after(E2))`.
/// - Otherwise, if `stripParens(E2)` is a `null` literal, then:
///   - Let `true(N) = after(E1)`.
///   - Let `false(N) = promoteToNonNull(E1, after(E2))`.
/// - Otherwise:
///   - Let after(N) = after(E2).
/// Note that it is tempting to generalize the two `null` literal cases to apply
/// to any expression whose type is `Null`, but this would be unsound in cases
/// where `E2` assigns to `x`. (Consider, for example,
/// `(int? x) => x == (x = null) ? true : x.isEven`, which tries to call
/// `null.isEven` in the event of a non-null input).
///
/// @description Checks that if `equivalentToNull(T1)` and `T2` is non-nullable,
/// or `equivalentToNull(T2)` and `T1` is non-nullable then
/// `after(N) = after(E2)`.
/// @author sgrekhov22@gmail.com
/// @issue 60114

test1<T extends Null>(T t) {
  late int i;
  int j;
  String s = "";
  if (s == t) {  // ignore: unnecessary_null_comparison
    i = 42; // `i` is definitely unassigned
  } else {
    j = 42;
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
  j; // Definitely assigned
}

test2<T extends Null>(T t) {
  late int i;
  int j;
  String s = "";
  if (t == s) {  // ignore: unnecessary_null_comparison
    i = 42;
  } else {
    j = 42;
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
  j;
}

main() {
  print(test1);
  print(test2);
}
