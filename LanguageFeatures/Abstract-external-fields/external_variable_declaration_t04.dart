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

var f1 = (external int i) {
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
};

var f2 = (final external int i) {
//              ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
};

class C {
  test() {
    var f3 = (external int i) {
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };

    var f4 = (final external int i) {
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

mixin M on C {
  test2() {
    var f5 = (external int i) {
//            ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };

    var f6 = (final external int i) {
//                  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    };
  }
}

extension on C {
   test3() {
     var f7 = (external int i) {
//             ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
     };
     var f8 = (final external int i) {
//                   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
     };
   }
 }

main() {
  new C();
}
