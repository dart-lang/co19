// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Each element in a list can be one of a few things:
///  A normal expression.
///  An if element.
///  A for element.
///  The body of if and for elements use listElement, not expression, which
///  allows nesting.
///
/// @description Checks that it is a compile error if the body of the 'if' and
/// 'for' elements is an expression
/// @author sgrekhov@unipro.ru

main() {
  bool b = true;
  List<int> listInt = [
    if (b) {1;},
//         ^^^^
// [analyzer] unspecified
// [cfe] unspecified
    if (!b) {1},
//          ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'Set<int>' can't be assigned to a variable of type 'int'.
    for (int i = 5; i < 10; i++) {i}
//                               ^^^
// [analyzer] COMPILE_TIME_ERROR.LIST_ELEMENT_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'Set<int>' can't be assigned to a variable of type 'int'.
  ];
}
