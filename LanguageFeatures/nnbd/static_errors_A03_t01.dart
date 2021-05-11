// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to call an expression whose type is potentially
/// nullable and not dynamic.
///
/// @description Check that it is a compile-time error to call an expression
/// whose type is potentially nullable and not dynamic. Test nullable function
/// type
/// @author sgrekhov@unipro.ru


void foo() {}

typedef void Foo();

main() {
  var f1 = foo as Function?;
  f1();
//^^
// [analyzer] unspecified
// [cfe] unspecified

  var f2 = foo as Foo?;
  f2();
//^^
// [analyzer] unspecified
// [cfe] unspecified
}
