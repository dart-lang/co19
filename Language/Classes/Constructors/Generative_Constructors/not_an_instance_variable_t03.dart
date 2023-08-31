// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if k's initializer list contains
/// an initializer for a variable that is not an instance variable declared in
/// the immediately surrounding class.
/// @description Checks that error is produced if the initializer list contains
/// an initializer for a static class variable.
/// @author rodionov


class C  {
  static var x = null;

  C() : x = 5 {}
//      ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
