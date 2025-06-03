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
/// @description Checks that `e?.length` is a constant expression if `e` is a
/// constant expression.
/// @author sgrekhov22@gmail.com
/// @issue 59904

const c = "c";

const c1 = "$c"?.length; // ignore: invalid_null_aware_operator
const String? one = "1";
const int? c2 = one?.length;
const String? three = null;
const int? c3 = three?.length;
const int? c4 = false ? null : three?.length;

main() {
  print(c1);
  print(c2);
  print(c3);
  print(c4);
}
