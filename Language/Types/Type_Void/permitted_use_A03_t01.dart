// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In support of the notion that the value of an expression with
/// static type `void` should be discarded, such objects can only be used in
/// specific situations: The occurrence of an expression of type `void` is a
/// compile-time error unless it is permitted according to one of the following
/// rules.
/// ...
/// - In a type cast `e as T`, `e` may have type `void`.
///
/// @description Checks that in a type cast `e as T`, `e` may have type `void`.
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

void foo() => 42;

main() {
  var v = foo() as int;
  Expect.equals(42, v);

  void x = 0;
  Expect.equals(0, x as int);
}
