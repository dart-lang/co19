// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Execution of a postfix expression of the form e1?.v++ is
/// equivalent to executing ((x) => x == null? null: x.v++)(e1) unless e1 is a
/// type literal, in which case it is equivalent to e1.v++ .
/// The static type of such an expression is the static type of e1.v.
/// @description Checks that static type of e1?.v++ is static type of e1.v. e1
/// is a type literal
/// @author sgrekhov@unipro.ru

class C {
  static int v = 0;
  static dynamic v2;
}

main() {
  int? a1 = C?.v++;
//           ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//          ^
// [cfe] The class 'C' cannot be null.
  try {
    int? a2 = C?.v2++;
//             ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
//            ^
// [cfe] The class 'C' cannot be null.
  } catch (e) {}
}
