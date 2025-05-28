// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a compile error if a class declares a static setter
/// named v= and also has a non-static member named v.
/// @description Checks that it is a compile error to declare more than one
/// entity with the same name in the same scope.
/// @author kaigorodov


class C {
  void foo() {}

  static set foo(String s) {}
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);

}
