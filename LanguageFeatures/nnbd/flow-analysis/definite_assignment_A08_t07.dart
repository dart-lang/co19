// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion assigned is a boolean value indicating whether the variable has
/// definitely been assigned at the given point in the source code. When assigned
/// is true, we say that the variable is definitely assigned at that point.
///
/// @description Checks definite assignment and try-catch statement
///
/// @author sgrekhov@unipro.ru


main() {
  int n;
  try {
    n = 42;
  } on String catch (_) {
    n = 42;
  } on int catch (_) {
    bool b = (() => true)();
    if (b) {
      n = 42;
    }
  }
  n; // It's an error to read local non-nullable variable when it is not definitely assigned
//^
// [analyzer] unspecified
// [cfe] unspecified
}
