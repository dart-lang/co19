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
/// declares wrong number of type parameters.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A05_t01.dart';

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C<T, X> {}
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M<T, X> {}
//              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E {
//           ^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

augment enum E<T, X> {
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

augment extension Ext {}
//                ^^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension Ext<T, X> {}
//                    ^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET<T, X> {}
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified
