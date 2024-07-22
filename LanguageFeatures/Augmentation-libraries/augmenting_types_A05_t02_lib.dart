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
/// declares type parameters with different bounds.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A05_t02.dart';

augment class C<T extends B> {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

augment class C<T extends Object> {}
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment class C<T extends List> {}
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M<T extends B> {}
//                        ^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M<T extends Object> {}
//                        ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment mixin M<T extends List> {}
//                        ^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment enum E<T extends B> {
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

augment enum E<T extends Object> {
//                       ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

augment enum E<T extends List> {
//                       ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  augment e1;
}

augment extension Ext<T extends B> {}
//                              ^
// [analyzer] unspecified
// [cfe] unspecified

augment extension Ext<T extends Object> {}
//                              ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension Ext<T extends List> {}
//                              ^^^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET<T extends B>(int _) {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET<T extends Object>(int _) {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified

augment extension type ET<T extends List>(int _) {}
//                     ^^
// [analyzer] unspecified
// [cfe] unspecified
