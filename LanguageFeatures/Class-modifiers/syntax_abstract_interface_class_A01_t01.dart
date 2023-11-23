// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract interface class can be implemented but not constructed,
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to construct an
/// `abstract interface class`
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

abstract interface class LocalAbstractInterfaceClass {}

abstract interface class LocalAbstractInterfaceClassWithConstructor {
  LocalAbstractInterfaceClassWithConstructor() {}
}

main() {
  AbstractInterfaceClass();
//^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LocalAbstractInterfaceClass();
//^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LocalAbstractInterfaceClassWithConstructor();
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
