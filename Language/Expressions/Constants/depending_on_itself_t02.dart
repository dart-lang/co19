// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the value of a compile-time
/// constant expression depends on itself.
/// @description Checks that it is a compile-time error if there is a circular
/// reference in a constant variable's initialization.
/// @author iefremov


const a1 = a10;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
const a2 = a1;
//    ^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT
const a3 = a2;
//    ^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT
const a4 = a3;
//    ^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT
const a5 = a4;
//    ^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT
const a6 = a5;
//    ^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT
const a7 = a6;
//    ^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT
const a8 = a7;
//    ^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT
const a9 = a8;
//    ^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT
const a10 = a9;
//    ^^^
// [analyzer] COMPILE_TIME_ERROR.RECURSIVE_COMPILE_TIME_CONSTANT

main() {
}
