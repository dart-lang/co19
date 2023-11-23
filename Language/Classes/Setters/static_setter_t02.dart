// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a compile error if a class declares a static setter
/// named v= and also has a non-static member named v.
/// @description Checks that it is a compile error to declare more static setter
/// and an instance getter with the same name
/// @author kaigorodov


class C {
  String get foo => "Lily was here";

  static set foo(String s) {}
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C.foo = "foo";
}
