// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a parameterized type [T] is
/// super-bounded when it is used in any of the following ways:
/// ...
/// [T] is an immediate subterm of an [extends] clause of a class (10.8), or it
/// occurs as an element in the type list of an [implements] clause (10.9), or a
/// [with] clause (10).
/// @description Checks that exception is thrown if super-bounded class occurs in
/// as an element in the type list of an [implements] clause
/// @author iarkh@unipro.ru

class A<T extends A<T>> {}

class B1 implements A {}
//                  ^
// [cfe] Inferred type argument 'A<dynamic>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'B1'.
//                  ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B2<X extends A<X>> implements A<X> {}

class B3 implements A<dynamic> {}
//                  ^
// [cfe] Type argument 'dynamic' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'B3'.
//                    ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B4 implements A<Object?> {}
//                  ^
// [cfe] Type argument 'Object?' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'B4'.
//                    ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B5 implements A<void> {}
//                  ^
// [cfe] Type argument 'void' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'B5'.
//                    ^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B6 implements A<Null> {}
//                  ^
// [cfe] Type argument 'Null' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'B6'.
//                    ^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS

class B7 implements A<A<dynamic>> {}
//                  ^
// [cfe] Type argument 'A<dynamic>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'B7'.
//                    ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B8 implements A<A<Object?>> {}
//                  ^
// [cfe] Type argument 'A<Object?>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'B8'.
//                    ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B9 implements A<A<void>> {}
//                  ^
// [cfe] Type argument 'A<void>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'B9'.
//                    ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B10 implements A<A<Null>> {}
//                     ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B6 implements A<Never> {}
//    ^^
// [analyzer] COMPILE_TIME_ERROR.DUPLICATE_DEFINITION
// [cfe] 'B6' is already declared in this scope.
class B10 implements A<A<Never>> {}
//    ^^^
// [analyzer] COMPILE_TIME_ERROR.DUPLICATE_DEFINITION
// [cfe] 'B10' is already declared in this scope.

main() {}
