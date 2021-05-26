// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion Any self reference in a typedef, either directly, or recursively
/// via another typedef, is a compile time error.
/// @description Checks that it is compile error if two typedefs are mutually
/// recursive via their return types.
/// @author ilya


typedef G F();
//        ^
// [analyzer] unspecified
// [cfe] unspecified
typedef F G();
//        ^
// [analyzer] unspecified

main() {
  try {
    F x;
  } catch (e) {}
}
