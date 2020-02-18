/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if a top level variable or static variable with a
 * non-nullable type has no initializer expression unless the variable is marked
 * with the `late` modifier.
 *
 * @description Check that it is an error if a top level variable or static
 * variable with a non-nullable type has no initializer expression unless the
 * variable is marked with the `late` modifier. Test FutureOr<Never>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";

FutureOr<Never> n;
//              ^
// [analyzer] unspecified
// [cfe] unspecified

class C {
  static FutureOr<Never> n1;
//                       ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
