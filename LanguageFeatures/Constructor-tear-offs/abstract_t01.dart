// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a constructor tear-off denotes a
/// generative constructor declared in an abstract class.
///
/// @description Checks that it is a compile time error to tear off a generative
/// constructor declared in an abstract class
/// @author sgrekhov@unipro.ru

abstract class C {
  C() {}
  C.named() {}
}

main() {
  var x = C.new;
//        ^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  var y = C.named;
//        ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

}
