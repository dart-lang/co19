// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract base class can be extended but not constructed,
/// implemented or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to tear off constructor
/// of an `abstract base class`
/// @author sgrekhov22@gmail.com

abstract base class AbstractBaseClass {
  AbstractBaseClass();
  AbstractBaseClass.x();
}

main() {
  var tf1 = AbstractBaseClass.new;
//          ^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var tf2 = AbstractBaseClass.x;
//          ^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
