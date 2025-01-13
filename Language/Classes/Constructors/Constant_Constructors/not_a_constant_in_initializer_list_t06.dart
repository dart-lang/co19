// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any expression that appears within the initializer list of a
/// constant constructor must be a potentially constant expression, or a
/// compile-time error occurs.
///
/// A potentially constant expression is an expression E that would be a valid
/// constant expression if all formal parameters of E's immediately enclosing
/// constant constructor were treated as compile-time constants that were
/// guaranteed to evaluate to an integer, boolean or string value as required
/// by their immediately enclosing superexpression.
///
/// @description Checks that it is not an error to use `String.length` in a
/// constant constructor's initializer list if the string is a constant.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

const String zero = "0";

class C {
  static const name = "name";
  final int v;

  const C() : v = "".length;
  const C.fromString(String s) : v = s.length;
  const C.fromGlobal() : v = zero.length;
  const C.fromName() : v = name.length;
}

main() {
  Expect.equals(0, const C().v);
  Expect.equals(3, const C.fromString("123").v);
  Expect.equals(1, const C.fromGlobal().v);
  Expect.equals(4, const C.fromName().v);
}
