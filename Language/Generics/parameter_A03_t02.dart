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
/// @description Checks that it is a compile error if typedef type variable is a
/// supertype of its upper bound.
/// @author iarkh@unipro.ru


typedef Alias1<X extends X> = void Function(X);
//             ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
// [cfe] Type 'X' can't use itself as a bound.
typedef Alias2<X extends Y, Y extends X> = void Function(X, Y);
//             ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
//                          ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
// [cfe] unspecified
typedef Alias3<X extends Y, Y extends Z, Z extends X> = void Function(X, Y, Z);
//             ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
//                          ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
//                                       ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_PARAMETER_SUPERTYPE_OF_ITS_BOUND
// [cfe] unspecified

main() {}
