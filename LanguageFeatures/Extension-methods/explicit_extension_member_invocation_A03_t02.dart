// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the static type of the argument
/// expression (expr) of an explicit extension invocation is `void`.
///
/// @description Check that it is a compile-time error if the static type of the
/// argument expression (expr) of an explicit extension invocation is `void`.
/// @author sgrekhov22@gmail.com
/// @issue 57082

extension ExtVoid on void {
  void checkme() {
    print("I'm extension");
  }
}

main() {
  void v = 42;
  v.checkme();
//^
// [analyzer] unspecified
// [cfe] unspecified

  ExtVoid(print("print() returns void")).checkme();
//        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
