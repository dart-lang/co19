// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion It is a compile-time error if the name of a named
/// optional parameter begins with an _ character.
/// @description Checks that it is a compile-time error if the name of a named
/// optional parameter begins with an '_' character.
/// @author rodionov
/// @reviewer kaigorodov


main() {
  try {
    void func({var _x}) {}
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
    func(_x: 1);
  } catch (x) {}
}
