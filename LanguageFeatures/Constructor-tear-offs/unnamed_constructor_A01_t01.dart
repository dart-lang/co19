// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If [C] denotes a class, an expression of [C] by itself already
/// has a meaning, it evaluates to a [Type] object representing the class, so it
/// cannot also denote the unnamed constructor.
///
/// @description Checks that class name cannot denote the unnamed constructor.
///
/// @author iarkh@unipro.ru

class A<T> {
  A();
}

main() {
  var v = A.A;
//          ^
// [analyzer] unspecified
// [cfe] unspecified
}
