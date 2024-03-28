// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An augmenting extension declares an on clause. We don't allow filling this
///   in for extensions, it must be on the original declaration. This
///   restriction could be lifted later if we have a compelling use case, as
///   there is no fundamental reason it cannot be allowed, although it would be
///   a parse error today to have an extension with no on clause.
///
/// @description Checks that it is a compile-time error if an augmenting
/// extension declares an `on` clause
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A04_t01.dart';

augment extension on C {
//                ^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment extension Ext on C {
//                    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
