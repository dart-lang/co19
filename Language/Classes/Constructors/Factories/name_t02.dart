// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if M is not the name of the immediately
/// enclosing class.
/// @description Checks that it's a compile-time error when factory keyword is
/// followed by a name that is not a constructor name.
/// @author rodionov


class C {
  factory WrongClass.id() => throw "Should not reach here";
//        ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
