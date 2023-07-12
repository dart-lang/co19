// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to preface a function declaration with
/// the built-in identifier static.
///
/// @description Checks that it is a compile-time error to preface a library
/// function declaration with 'static'.
/// @author msyabro

  static void f() {}
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  f();
}
