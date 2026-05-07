// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All usages of ’constant’ in Dart are associated with compile time.
/// A potentially constant expression is an expression that will generally yield
/// a constant value when the values of certain parameters are given. The
/// constant expressions is a subset of the potentially constant expressions
/// that can be evaluated at compile time.
///
/// The potentially constant expressions and constant expressions are the
/// following:
/// ...
/// • A literal symbol is a potentially constant and constant expression.
///
/// @description Checks that literal symbol can be assigned to a constant
/// variable.
/// @author ilya

import "../../../Utils/expect.dart";

const c = #foo;

main() {
  Expect.identical(c, #foo);
}
