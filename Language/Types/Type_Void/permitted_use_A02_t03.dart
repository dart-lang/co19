// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - In the initialization and increment expressions of a for-loop,
/// `for (e1; e2; e3) ...`, `e1` may have type `void`, and each of the
/// expressions in the expression list `e3` may have type `void`.
///
/// @description Checks that increment expression of a `for (e1; e2; e3) ...`
/// loop may have type `void`.
/// @author sgrekhov22@gmail.com

void foo() {}

main() {
  for (var i = 0;; foo()) {
    if (i > 0) {
      break;
    }
    i++;
  }
  void v = 0;
  for (var i = 0;; foo(), v) {
    if (i > 0) {
      break;
    }
    i++;
  }
}
