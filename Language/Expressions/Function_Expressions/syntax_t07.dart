// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A function literal is an object that encapsulates an executable
/// unit of code.
/// functionExpression:
///   formalParameterList functionExpressionBody
/// ;
/// @description Checks that it is a compile-time error to call non-function type
/// as a function.
/// @author sgrekhov@unipro.ru

typedef tf();

main() {
  null();
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
  (tf p1, tf p2) => null();
//                  ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  42();
//^^
// [analyzer] unspecified
// [cfe] unspecified
  "x"();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
  3.14();
//^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
