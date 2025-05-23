// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is a compile error when assigning the result of
/// a `void` method invocation to a variable whose declared type is not `void`
/// @author sgrekhov@unipro.ru

void foo() {}

main() {
  dynamic i = foo();
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified

  Object? j = foo();
//            ^^^
// [analyzer] unspecified
// [cfe] unspecified
}
