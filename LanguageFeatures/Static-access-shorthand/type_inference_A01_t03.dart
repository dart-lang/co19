// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a shorthand context type schema has the form `C` or `C<...>`,
/// and `C` is a type introduced by the type declaration `D`, then the shorthand
/// context denotes the type declaration `D`. If a shorthand context `S` denotes
/// a type declaration `D`, then so does a shorthand context of `S?` and
/// `FutureOr<S>`. Otherwise, a shorthand context does not denote any
/// declaration.
///
/// @description Checks that it is a compile-time error if a shorthand context
/// doesn't denote any declaration.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'shorthand_lib.dart';

main() {
  var v1 = .id1;
//         ^
// [analyzer] unspecified
// [cfe] unspecified

  final v2 = .id2(2);
//           ^
// [analyzer] unspecified
// [cfe] unspecified

  const v3 = .id3<int>(3);
//           ^
// [analyzer] unspecified
// [cfe] unspecified
}
