// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the extends clause of a class C
/// specifies an enumerated type, a malformed type or a deferred type as a
/// superclass.
/// @description Checks that it is a compile-time error if deferred type is used
/// as a superclass
/// @Issue 42031
/// @author sgrekhov@unipro.ru



import "dart:core" deferred as core;
//     ^
// [analyzer] unspecified
// [cfe] unspecified

class A extends core.ArgumentError {}
//              ^
// [analyzer] unspecified

main() {
  new A();
  new core.ArgumentError();
}
