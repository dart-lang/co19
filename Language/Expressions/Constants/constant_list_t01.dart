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
/// - A constant list literal is a potentially constant and constant expression.
///
/// @description Checks that a constant list literal of the form
/// `const <T>[e1, ..., en]`, or `<T>[e1, ..., en]` that occurs in a constant
/// context are constants.
/// @author iefremov

import '../../../Utils/expect.dart';

main() {
  const c1 = <int>[1, 2];
  var c2 = const [1, 2];

  var c3 = const <num>[];
  const List<num> c4 = [];

  const c5 = <Object>[[], {}, ()];
  var c6 = const [[], {}, ()];

  Expect.identical(c1, c2);
  Expect.identical(c3, c4);
  Expect.identical(c5, c6);
}
