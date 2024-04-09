// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The type parameters of the type augmentation do not match the original
///   type's type parameters. This means there must be the same number of type
///   parameters with the same bounds and names.
///
/// @description Checks that it is a compile-time error if an augmenting type
/// declares type parameters with different names
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A05_t03.dart';

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
