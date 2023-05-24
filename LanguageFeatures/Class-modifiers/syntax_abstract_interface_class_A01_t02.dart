// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract interface class can be implemented but not constructed,
/// extended or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to tear off constructor
/// of an `abstract interface class`
/// @author sgrekhov22@gmail.com

abstract interface class AbstractInterfaceClass {
  AbstractInterfaceClass();
  AbstractInterfaceClass.x();
}

main() {
  var tf1 = AbstractInterfaceClass.new;
//          ^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var tf2 = AbstractInterfaceClass.x;
//          ^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
