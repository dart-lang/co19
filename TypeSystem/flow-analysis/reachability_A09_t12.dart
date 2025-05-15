// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion operator!= If `N` is an expression of the form `E1 != E2`, it is
/// treated as equivalent to the expression `!(E1 == E2)`.
///
/// @description Checks that if a nullable extension type which implements
/// `Object` is compared with the `null` literal, then a variable assigned in
/// true or false branch is possibly assigned.
/// @author sgrekhov22@gmail.com
/// @issue 60114

extension type ET(num v) implements Object {}

test1() {
  late int j;
  late int i;
  ET? et = 2 > 1 ? null : ET(0);

  if (et != null) {
    i = 42;
  } else {
    j = 42;
  }
  j; // Possibly assigned
  i; // Possibly unassigned
}

test2() {
  late int j;
  late int i;
  ET? et = 2 > 1 ? ET(0) : null;

  if (null != et) {
    i = 42;
  } else {
    j = 42;
  }
  j;
  i;
}

main() {
  try {
    test1();
  } catch (_) {}
  try {
    test2();
  } catch (_) {}
}
