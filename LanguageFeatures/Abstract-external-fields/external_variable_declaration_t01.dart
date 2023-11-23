// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An external variable declaration is a non-local, non-parameter
/// variable declaration prefixed by the modifier external. The declaration must
/// not be abstract, const, or late, and it cannot have an initializer expression
///
/// @description Checks that it is a compile error if an external variable
/// declaration is local
/// @author sgrekhov@unipro.ru

var foo = () {
  external int j1;
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final external int j2;
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
};

class C {
  test() {
    external int i1;
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    final external i2;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  external var e1;
//^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  final external e2;
//      ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  var f = () {
    external String s1;
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    final external String s2;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  };
}
