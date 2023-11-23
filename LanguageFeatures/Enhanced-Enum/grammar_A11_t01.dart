// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the initializer list of a
/// non-redirecting generative constructor includes a super constructor
/// invocation.
///
/// @description Check that it's a compile-time error if the initializer list of
/// a non-redirecting generative constructor includes a super constructor
/// invocation.
/// @author sgrekhov22@gmail.com

enum E1 {
  e1,
  e2;

  const E1() : super();
//             ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E2<T> {
  e1<int>(1),
  e2<String>.foo("2");

  const E2(Object val);
  const E2.foo(Object val) : super();
//                           ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E3<T> {
  e1<int>(1),
  e2<String>("2"),
  e3<bool>.foo();

  const E3(this.val);
  const E3.foo() : this.val = true, super();
//                                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final val;
}

main() {
  print(E1);
  print(E2);
  print(E3);
}
