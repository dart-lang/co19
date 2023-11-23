// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if M is not the name of the
/// immediately enclosing class.
/// @description Checks that it's a compile-time error when M is a name of an
/// unrelated class available in the same scope.
/// @author iefremov


class Z {}

class C {
  factory Z() => throw "Should not reach here";
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
//    ^
// [cfe] unspecified
}
