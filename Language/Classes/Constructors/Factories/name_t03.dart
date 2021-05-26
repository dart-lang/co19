// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if M is not the name of the
/// immediately enclosing class.
/// @description Checks that it's a compile-time error when M is the name of
/// the enclosing class's superclass.
/// @author rodionov


class S {}

class C extends S {
  factory S() {}
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  try {
    new C();
//      ^
// [cfe] unspecified
  } catch (anything) {}
}
