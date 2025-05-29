// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The potentially constant expressions and constant expressions are
/// the following:
/// ...
/// • An expression of the form `e?.length` is potentially constant if `e` is a
///   potentially constant expression. It is further constant if `e` is a
///   constant expression that evaluates to `null`, or it evaluates to an
///   instance of `String` and `length` denotes an instance getter invocation.
///
/// @description Checks that `e?.length` is apotentially constant expression if
/// `e` is a potentially constant expression.
/// @author sgrekhov22@gmail.com

class C {
  const C();

  @override
  String toString() {
    return "Arbitrary code";
  }
}

const c = const C();

// "$c" is a potentially constant but not a constant. `true ? e2 : e3` is a
// constant only if `e2` is constant and `e3` is a potentially constant.
const int? c1 = true ? null : "$c"?.length;

main() {
  print(c1);
}
