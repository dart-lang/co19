// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that  it is a compile-time error to pass a value with
/// static type `void` to the function which expecting a non-void argument.
/// @issue 30177
/// @author sgrekhov@unipro.ru

void v = null;

void foo(dynamic _) {}
void bar(Null _) {}

main() {
  print(v);
//      ^
// [analyzer] unspecified
// [cfe] unspecified
  print(print("print() returns void"));
//      ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  foo(v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  foo(print(""));
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  bar(v);
//    ^
// [analyzer] unspecified
// [cfe] unspecified
  bar(print(""));
//    ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
