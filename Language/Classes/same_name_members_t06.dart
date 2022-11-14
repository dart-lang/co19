// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if a class declares two members of 
/// the same name.
/// @description Checks that it is a compile-time error if a class declares 
/// an instance method and an abstract getter of the same name.
/// @author kaigorodov

class C {
  String f(int f) {}
  int get f;
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  new C();
}
