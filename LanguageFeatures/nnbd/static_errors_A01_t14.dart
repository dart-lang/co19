/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call a method, setter, getter or operator on
 * an expression whose type is potentially nullable and not dynamic, except for
 * the methods, setters, getters, and operators on Object.
 *
 * @description Check that it is a compile-time error to call a method, setter,
 * getter or operator on an expression whose type is potentially nullable. Test
 * the case <T* extends int?>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

main() {
  B<int?> b = new B<int?>(42);
  b.x.isEven;
//   ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  b.x.abs();
//    ^^^
// [analyzer] unspecified
// [cfe] unspecified

  b.x + b.x;
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
