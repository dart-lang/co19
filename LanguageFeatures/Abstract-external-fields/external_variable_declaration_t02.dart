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

class C {
}

mixin M on C {
  test() {
    external var e;
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

    final external fe;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
extension on C {
  foo() {
    external var e;
//  ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
    final external fe;
//        ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new C().foo();
}
