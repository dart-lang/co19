// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The type parameters of the augmenting declaration do not match the
///   augmented declarations's type parameters. This means there must be the
///   same number of type parameters with the exact same type parameter names
///   (same identifiers) and bounds if any (same types, even if they may not be
///   written exactly the same in case one of the declarations needs to refer to
///   a type using an import prefix).
///
/// @description Checks that it is a compile-time error if an augmenting type
/// declares type parameters with different names.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmenting_types_A05_t03.dart';

augment class C<X extends A, Z> {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C<T extends A, Y> {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C<Y extends A, X> {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M<X extends A, Z> {}
//                           ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M<T extends A, Y> {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M<Y extends A, X> {}
//              ^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E<X extends A, Z> {
//                          ^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

augment enum E<T extends A, Y> {
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

augment enum E<Y extends A, X> {
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

augment extension Ext<X extends A, Z> {}
//                                 ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension Ext<T extends A, Y> {}
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension Ext<Y extends A, X> {}
//                    ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET<X extends A, Z> {}
//                                     ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET<T extends A, Y> {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET<Y extends A, X> {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
