// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a setter declares a return type
/// other than void
/// @description Checks that a compile-time error is produced if a setter
/// declares int as its return type.
/// @author vasya


class C {
  int set foo(var x) {
//^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  new C().foo = 1;
}
