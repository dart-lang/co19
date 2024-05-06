// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A local declaration whose name is `_` does not bind that name to
/// anything.
///
/// @description Checks that it is a compile-time error to access the value of
/// a local declaration named `_`. Test catch clause parameters.
/// @author sgrekhov22@gmail.com

main() {
  try {
    throw "!";
  } catch (_) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
  try {
    throw Exception("!");
  } on Exception catch(_) {
    print(_);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}
