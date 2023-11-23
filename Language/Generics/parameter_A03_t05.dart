// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///    typeParameter ::= metadata identifier (extends typeNotVoid)?
///    typeParameters ::= ‘<’ typeParameter (‘,’ typeParameter)* ‘>’
/// ...
/// It is a compile-time error if a type parameter is a supertype of its upper
/// bound when that upper bound is itself a type variable.
/// This prevents circular declarations like [X extends X] and [X extends Y, Y
/// extends X].
/// @description Checks that it is a compile error if function type variable is a
/// supertype of its upper bound.
/// @author iarkh@unipro.ru


void func1<X extends X>(X) {}
//         ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
// [cfe] Type 'X' can't use itself as a bound.
void func2<X extends Y, Y extends X>(X, Y) {}
//         ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
//                      ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
// [cfe] unspecified
void func3<X extends Y, Y extends Z, Z extends X>(X, Y, Z) {}
//         ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
//                      ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
//                                   ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
// [cfe] unspecified

main() {}
