// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An external variable declaration is a non-local, non-parameter
/// variable declaration prefixed by the modifier external. The declaration must
/// not be abstract, const, or late, and it cannot have an initializer expression
///
/// @description Checks that it is a compile error if an external variable
/// declaration is abstract
/// @author sgrekhov@unipro.ru

abstract class C {
  abstract external int i;
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final abstract external int j;
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M on C {
  abstract external int x;
//         ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final abstract external int y;
//               ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
