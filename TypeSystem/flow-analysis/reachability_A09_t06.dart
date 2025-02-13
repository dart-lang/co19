// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator!= If `N` is an expression of the form `E1 != E2`, it is
/// treated as equivalent to the expression `!(E1 == E2)`.
///
/// @description Checks that an expression of the form `E1 != E2` is treated as
/// equivalent to the expression `!(E1 == E2)`. Test `equivalentToNull(T1)` and
/// `T2` is non-nullable, or `equivalentToNull(T2)` and `T1` is non-nullable
/// case.
/// @author sgrekhov22@gmail.com
/// @issue 60114

test1<T extends Null>(T t) {
  int i;
  String s = "";
  if (s != t) { // ignore: unnecessary_null_comparison
    i = 42; // `i` is definitely assigned here
  }
  i; // It is not an error to read a local non-nullable variable which is definitely assigned
}

test2<T extends Null>(T t) {
  int i;
  String s = "";
  if (t != s) { // ignore: unnecessary_null_comparison
    i = 42; // `i` is definitely assigned here
  }
  i; // It is not an error to read a local non-nullable variable which is definitely assigned
}

main() {
  test1(null);
  test2(null);
}
