// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let e be an expression; e occurs in a constant context iff one of
/// the following applies:
/// ...
/// • e is an immediate subexpression of an expression e0 which occurs in a
///   constant context, where e0 is not a function literal
///
/// @description Checks that an expression `e` is a constant expression if `e`
/// is an immediate subexpression of an expression `e0` which occurs in a
/// constant context, where `e0` is not a function literal
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';

class C {
  final val;
  const C(this.val);
}

Object foo(Object o) => o;

main() {
  var c1 = const C(C(1));
  const c2 = 2 > 1 ? C(0) : C(1);
  var c3 = identical(C(3), C(3));
  const c4 = identical(C(3), C(3));

  Expect.identical(const C(1), c1.val);
  Expect.identical(const C(0), c2);
  Expect.isFalse(c3);
  Expect.isTrue(c4);
}
