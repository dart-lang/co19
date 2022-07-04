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
/// as an element in the type list of [with] clause
/// @author iarkh@unipro.ru


class A<T extends A<T>> {}
class C {}

class B1 extends C with A {}
//                      ^
// [cfe] Type argument 'A<dynamic>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'C with A'.
//                      ^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B2<X extends A<X>> extends C with A<X> {}

class B3 extends C with A<dynamic> {}
//                      ^
// [cfe] Type argument 'dynamic' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'C with A'.
//                        ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B4 extends C with A<Object?> {}
//                      ^
// [cfe] Type argument 'Object?' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'C with A'.
//                        ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B5 extends C with A<void> {}
//                      ^
// [cfe] Type argument 'void' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'C with A'.
//                        ^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B6 extends C with A<Null> {}
//                      ^
// [cfe] Type argument 'Null' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'C with A'.
//                        ^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS

class B7 extends C with A<A<dynamic>> {}
//                      ^
// [cfe] Type argument 'A<dynamic>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'C with A'.
//                        ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B8 extends C with A<A<Object?>> {}
//                      ^
// [cfe] Type argument 'A<Object?>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'C with A'.
//                        ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B9 extends C with A<A<void>> {}
//                      ^
// [cfe] Type argument 'A<void>' doesn't conform to the bound 'A<T>' of the type variable 'T' on 'A' in the supertype 'A' of class 'C with A'.
//                        ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
class B10 extends C with A<A<Null>> {}
//                         ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class B11 extends C with A<Never> {}
class B12 extends C with A<A<Never>> {}

main() {}
