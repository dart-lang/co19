// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant variable must be initialized to a compile-time 
/// constant or a compile-time error occurs.
///
/// @description Checks that it is a compile time error if constant variable is
/// initialized by not a compile-time constant.
/// @author sgrekhov@unipro.ru

class Foo {
  int get length => 42;
  const Foo();
}

main() {
  const f = Foo();
  const l1 = f.length;
//           ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  const b = 42.isEven;
//          ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
