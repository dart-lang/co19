// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator!= If `N` is an expression of the form `E1 != E2`, it is
/// treated as equivalent to the expression `!(E1 == E2)`.
///
/// @description Checks that if a non-nullable extension type which implements
/// `Object` is compared with the `null` literal, then a variable assigned in
/// true or false branch is definitely (un)assigned.
/// @author sgrekhov22@gmail.com
/// @issue 60114

extension type ET(num v) implements Object {}

test1() {
  int j;
  late int i;
  ET et = ET(0);

  if (et != null) { // ignore: unnecessary_null_comparison
    i = 42;
  } else {
    j = 42;
  }
  i; // Definitely assigned
  j; // Definitely unassigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}

test2() {
  int j;
  late int i;
  ET et = ET(0);

  if (null != et) { // ignore: unnecessary_null_comparison
    i = 42;
  } else {
    j = 42;
  }
  i;
  j;
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(test1);
  print(test2);
}
