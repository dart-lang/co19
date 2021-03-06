// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An abstract instance variable declaration is an instance variable
/// declaration prefixed by the modifier abstract. The declaration must not be
/// late, and it cannot have an initializer expression.
///
/// @description Checks that it is a compile error if abstract variable has an
/// initializer expression
/// @author sgrekhov@unipro.ru


abstract class C {
  abstract var x = 42;
//             ^
// [analyzer] unspecified
// [cfe] unspecified

  abstract int y = 42;
//             ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
}
