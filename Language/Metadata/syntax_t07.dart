// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///  metadata:
///   (‘@’ qualified (‘.’ identifier)? (arguments)?)*
///   ;
/// @description Check that it is a compile time error,
/// if closing arguments parenthesis is missing
/// @author a.semenov@unipro.ru

class A {
  const A();
}

@A(
//^
// [cfe] unspecified
  class B {}
//^^^^^^^^^
// [cfe] unspecified
// [analyzer] unspecified

  main() {
//^^^^
// [cfe] unspecified
// [analyzer] unspecified
}
// [error line 33, column 0]
// [analyzer] unspecified
// [cfe] unspecified
