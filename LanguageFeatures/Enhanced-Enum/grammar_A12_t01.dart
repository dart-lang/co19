// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the argument list of a
/// non-redirecting generative constructor includes a super parameter.
///
/// @description Check that it's a compile-time error if the argument list of a
/// non-redirecting generative constructor includes a super parameter.
/// @author sgrekhov22@gmail.com

mixin M {
  void set x(int val) {}
}

enum E1 with M {
  e1(1),
  e2(2);

  const E1(super.x);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e1<Type>(String),
  e2<int>.foo(0);

  const E2(super.runtimeType);
//                   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const E2.foo(super.hashCode);
//                   ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(E1);
  print(E2);
}
