// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Likewise, the grammar for an augmenting `mixin` declaration does
/// not allow specifying an `on` clause. Only the introductory declaration
/// permits that.
///
/// @description Checks that it is a syntax error if an augmenting declaration
/// specifies `on` clause on a `mixin`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {}

mixin M1 {}

mixin M2 on C {}

augment mixin M1 on C {
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

augment mixin M2 on Object {
//                  ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M1);
  print(M2);
}
