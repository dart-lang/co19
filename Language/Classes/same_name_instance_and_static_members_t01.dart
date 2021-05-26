// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a class has an instance member and 
/// a static member with the same name.
/// @description Checks that it is a compile-time error if a class inherits an 
/// instance method and declares a static member method with the same name.
/// @author kaigorodov


class B {
  int func() {}
}

class A extends B {
  static int func() {}
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  try {
    new A();
  } catch (e) {}
}
