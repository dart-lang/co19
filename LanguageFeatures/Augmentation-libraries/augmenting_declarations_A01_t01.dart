// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// - An augmenting declaration has no corresponding original declaration to
///   apply to.
///
/// @description Checks that it is a compile-time error if an augmenting
/// declaration has no corresponding original declaration to apply to
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

augment class C {}
//            ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C);
}
