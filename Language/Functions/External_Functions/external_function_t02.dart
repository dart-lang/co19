// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An external function is a function whose body is provided
/// separately from its declaration. An external function may be a top-level
/// function, a method, a getter, a setter, or a non-redirecting constructor.
///
/// @description Checks that it is a compile-time error to declare a redirecting
/// constructor as `external`
/// @author sgrekhov22@gmail.com

class C1 {
  C1();
  external C1.n1() : this();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 {
  external const C2();
  external C2.n1() : this();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
}
