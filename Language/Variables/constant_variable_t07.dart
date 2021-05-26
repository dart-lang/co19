// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @assertion A constant variable is a variable whose declaration includes the 
/// modifier const. A constant variable is always implicitly final.
/// @description Checks that a compile-time error occurs if a global constant 
/// variable is not initialized at declaration.
/// @author msyabro
/// @reviewer iefremov


const foo;
//    ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  foo;
}
