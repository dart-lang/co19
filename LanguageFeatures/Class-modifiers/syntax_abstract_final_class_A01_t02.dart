// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abstract final class cannot be constructed, extended, implemented
/// or mixed in and is not exhaustive
///
/// @description Checks that it is a compile-time error to tear off constructor
/// of an `abstract final class`
/// @author sgrekhov22@gmail.com

abstract final class AbstractFinalClass {
  AbstractFinalClass();
  AbstractFinalClass.x();
}

main() {
  var tf1 = AbstractFinalClass.new;
//          ^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var tf2 = AbstractFinalClass.x;
//          ^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
