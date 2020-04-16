/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to read a field or tear off a method from an
 * expression whose type is potentially nullable and not dynamic, except for the
 * methods and fields on Object.
 *
 * @description Check that it is a compile-time error to read a field or tear
 * off a method from an expression whose type is potentially nullable. Test
 * class A*
 * @author sgrekhov@unipro.ru
 * @issue 41495
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

main() {
  A? a1 = new A();
  a1.c1;
//  ^^^
// [analyzer] unspecified
// [cfe] unspecified

  a1.test;
//  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
