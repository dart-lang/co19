// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Only class types that can be subclassed, can be used as
/// super-class constraints. Types like void, dynamic, FutureOr<X> or
/// void Function(X) are not class types, and some platform types, including
/// int, bool and Null, cannot be subclassed, so none of these types can be used
/// as super-class constraints.
///
/// @description Checks that class types that cannot be subclassed, cannot be
/// used as super-class constraints.
/// @author ngl@unipro.ru

typedef F = void Function(int);

abstract class I {}

mixin M1 on void implements I {}
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M2 on dynamic implements I {}
//          ^^^^^^^
// [cfe] The type 'dynamic' can't be used as supertype.
// [analyzer] COMPILE_TIME_ERROR.MIXIN_SUPER_CLASS_CONSTRAINT_NON_INTERFACE
mixin M3 on FutureOr<num> implements I {}
//          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M4 on F implements I {}
//          ^
// [cfe] The type 'F' which is an alias of 'void Function(int)' can't be used as supertype.
// [analyzer] COMPILE_TIME_ERROR.MIXIN_SUPER_CLASS_CONSTRAINT_NON_INTERFACE
mixin M5 on int implements I {}
//    ^
// [cfe] 'int' is restricted and can't be extended or implemented.
//          ^^^
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DISALLOWED_TYPE
mixin M6 on bool implements I {}
//    ^
// [cfe] 'bool' is restricted and can't be extended or implemented.
//          ^^^^
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DISALLOWED_TYPE
mixin M7 on Null implements I {}
//          ^^^^
// [cfe] 'Null' is restricted and can't be extended or implemented.
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DISALLOWED_TYPE

main() {
}
