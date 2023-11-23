// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract class can be extended and implemented but not
/// constructed, mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to tear off constructor
/// of an `abstract class`
/// @author sgrekhov22@gmail.com

abstract class AbstractClass {
  AbstractClass();
  AbstractClass.x();
}

main() {
  var tf1 = AbstractClass.new;
//          ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var tf2 = AbstractClass.x;
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
