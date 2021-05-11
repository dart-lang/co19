// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let k be a generative constructor. It is a compile-time error if
/// more than one initializer corresponding to a given instance variable appears
/// in k's initializer list.
/// @description Checks that a compile-time error is produced if two identical
/// initializers appear in an initializer list.
/// @author vasya
/// @issue 41965


class C {
  C(x, y) : this.x = x, this.x = y;
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  var x;
}

main() {
  new C(0, 1);
}
