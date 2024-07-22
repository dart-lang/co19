// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - An augmenting extension declares an `on` clause (this is a syntax error).
///   We also do not allow adding further restrictions to a `mixin` declaration,
///   so no further types can be added to its `on` clause, if it even has one.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration adds any additional types to mixin's `on` clause.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment library 'augmenting_types_A04_t02.dart';

augment mixin M1 on C {
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M2 on Object {
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
