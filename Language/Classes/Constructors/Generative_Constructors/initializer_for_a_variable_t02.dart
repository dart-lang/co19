// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let k be a generative constructor. It is a compile-time error if
/// k's initializer list contains an initializer for a variable that is
/// initialized by means of an initializing formal of k.
/// @description Checks that it is a compile-time error if k's initializer
/// list contains an initializer for a variable that is initialized by means of
/// an initializing formal of k (field initializer uses just the variable name).
/// @author rodionov


class C {
  C(this.x, foo) : x = foo;
//                 ^
// [analyzer] unspecified
// [cfe] unspecified

  var x;
}

main() {
  new C(0, 1);
}
