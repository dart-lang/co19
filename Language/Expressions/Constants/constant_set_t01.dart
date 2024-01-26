// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// • A constant set literal, const <T>{e1, ..., en}, or <T>{e1, ..., en} that
///   occurs in a constant context, is a potentially constant expression if T is
///   a constant type expression, and e1, . . . , en are constant expressions.
///   It is further a constant expression if the set literal evaluates to an
///   object.
///
/// @description Checks that a constant set literal of the for
/// `const <T>{e1, ..., en}`, or `<T>{e1, ..., en}` that occurs in a constant
/// context are constants
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

main() {
  const c1 = <int>{1, 2};
  var c2 = const {1, 2};

  var c3 = const <num>{};
  const Set<num> c4 = {};

  const c5 = <Object>{[], {}, ()};
  var c6 = const {[], {}, ()};

  Expect.identical(c1, c2);
  Expect.identical(c3, c4);
  Expect.identical(c5, c6);
}
