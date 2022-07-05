// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A mixin declaration defines an interface. The interface for this
/// mixin declaration is equivalent to the interface of the class declared as:
///  abstract class A<X extends S, Y extends T> extends A$super<X, Y>
///    implements D, E { body' }
/// where body' contains abstract declarations corresponding to the instance
/// members of body of the mixin A.
/// . . .
/// This again means that the types of the implements clause must be subclassable
/// class types.
///
/// @description Checks that types that from implements clause must be
/// subclassable class types.
/// @author ngl@unipro.ru

typedef F = void Function(num);

class B {}
class C {}

mixin M1 on B, C implements void {}
//                          ^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M2 on B, C implements dynamic {}
//                          ^^^^^^^
// [cfe] The type 'dynamic' can't be used as supertype.
// [analyzer] COMPILE_TIME_ERROR.IMPLEMENTS_NON_CLASS
mixin M3 on B, C implements FutureOr<List> {}
//                          ^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
mixin M4 on B, C implements F {}
//                          ^
// [cfe] The type 'F' which is an alias of 'void Function(num)' can't be used as supertype.
// [analyzer] COMPILE_TIME_ERROR.IMPLEMENTS_NON_CLASS
mixin M5 on B, C implements int {}
//    ^
// [cfe] 'int' is restricted and can't be extended or implemented.
//                          ^^^
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DISALLOWED_TYPE
mixin M6 on B, C implements bool {}
//    ^
// [cfe] 'bool' is restricted and can't be extended or implemented.
//                          ^^^^
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DISALLOWED_TYPE
mixin M7 on B, C implements Null {}
//                          ^^^^
// [cfe] 'Null' is restricted and can't be extended or implemented.
// [analyzer] COMPILE_TIME_ERROR.SUBTYPE_OF_DISALLOWED_TYPE

main() {
}
