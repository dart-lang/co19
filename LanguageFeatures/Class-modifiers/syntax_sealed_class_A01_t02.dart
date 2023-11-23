// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Sealed class cannot be constructed, extended, implemented or
/// mixed in but is exhaustive
///
/// @description Checks that it is a compile-time error to tear off constructor
/// of a `sealed class`
/// @author sgrekhov22@gmail.com

sealed class SealedClass {
  SealedClass();
  SealedClass.x();
}

main() {
  var tf1 = SealedClass.new;
//          ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var tf2 = SealedClass.x;
//          ^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
