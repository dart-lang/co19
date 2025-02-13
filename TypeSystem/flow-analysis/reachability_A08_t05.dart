// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
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
/// `equivalentToNull(T2)` and `T1` is non-nullable, then:
///   - Let `true(N) = unreachable(after(E2))`.
///   - Let `false(N) = after(E2)`.
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
/// then `true(N) = unreachable(after(E2))` and `false(N) = after(E2)`.
/// @author sgrekhov@unipro.ru
/// @issue 41981
/// @issue 60114

// Requirements=nnbd-strong

String get s => "Lily was here";

main() {
  late int i;
  if (null == s) {  // ignore: unnecessary_null_comparison
    i = 42; // `i` is definitely unassigned
  }
  i;
//^
// [analyzer] unspecified
// [cfe] unspecified
}
