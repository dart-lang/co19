// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a
/// `<defaultDeclaringNamedParameter>` has the modifier `required` as well as a
/// default value.
///
/// @description Check that it is a compile-time error if a
/// `<defaultDeclaringNamedParameter>` has the modifier `required` as well as a
/// default value. Test a class.
/// @author sgrekhov22@gmail.com

// TODO (sgrekhov) Add `declaring-constructors` experimental flag

class A(var int v);

class C1({required var int v = 0}) {
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  this({required final int v = 0});
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3({required super.v = 0}) extends A;
//                         ^
// [analyzer] unspecified
// [cfe] unspecified
class C4 extends A {
  this({required super.v = 0});
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(C4);
}
