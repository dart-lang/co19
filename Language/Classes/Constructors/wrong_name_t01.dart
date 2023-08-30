// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constructor name always begins with the name of its immediately
/// enclosing class or interface, and may optionally be followed by a dot and an
/// identifier id.  .  .  .   It is a compile-time error if the name of a
/// constructor is not a constructor name.
/// @description Checks that a compile-error is produced when a named constructor
/// definition does not begin with the name of its class.
/// @author iefremov


class C {
  Z.wrongNamedConstructor();
//^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}
