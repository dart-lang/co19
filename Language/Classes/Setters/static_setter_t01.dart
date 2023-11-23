// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  It is a compile time error if a class declares a static setter
/// named v= and also has a non-static member named v.
/// @description Checks that it is a compile time error if a class declares a
/// static setter named v= and also has a non-static field named v.
/// @author kaigorodov


class C {
  String foo = "Lily was here";
//       ^
// [cfe] unspecified

  static set foo(String s) {}
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C.foo = "foo";
//  ^
// [analyzer] unspecified
// [cfe] unspecified
}
