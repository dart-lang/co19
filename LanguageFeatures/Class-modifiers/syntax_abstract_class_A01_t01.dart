// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract class can be extended and implemented but not
/// constructed, mixed in and is not exhaustive
///
/// @description Check that it is a compile-time error to construct an
/// `abstract class`
/// @author sgrekhov22@gmail.com

import "class_modifiers_lib.dart";

abstract class LocalAbstractClass {}

abstract class LocalAbstractClassWithConstructor {
  LocalAbstractClassWithConstructor() {}
}

main() {
  AbstractClass();
//^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LocalAbstractClass();
//^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  LocalAbstractClassWithConstructor();
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
