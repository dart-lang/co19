// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let k be a generative constructor. It is a compile-time error if
/// more than one initializer corresponding to a given instance variable appears
/// in k's initializer list.
/// @description Checks that a compile-time error is produced if the same
/// instance variable is initialized more than once in an initializer list
/// (referenced by just the name).
/// @author rodionov
/// @issue 41965


class C {
  C() : x = 1, y = 2, x = 3;
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  var x;
  var y;
}

main() {
  new C();
}
