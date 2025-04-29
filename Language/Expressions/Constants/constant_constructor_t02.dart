// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A potentially constant expression is an expression that will
/// generally yield a constant value when the values of certain parameters are
/// given. The constant expressions is a subset of the potentially constant
/// expressions that can be evaluated at compile time.
/// ...
/// The potentially constant expressions and constant expressions are the
/// following:
/// ...
/// - A constant object expression is a potentially constant and constant
///   expression.
///
/// @description Checks that a value created using constant constructor with
/// a prefix is a constant expression.
/// @author ngl@unipro.ru

import '../../../Utils/expect.dart';
import 'constants_lib.dart' as clib;

class A {
  const A() : a = "hello";
  final a;
}

final constList = const [
  const A(),
  const clib.A()
];

main() {
  Expect.isTrue(constList is List);
  Expect.runtimeIsType<List>(constList);
}
