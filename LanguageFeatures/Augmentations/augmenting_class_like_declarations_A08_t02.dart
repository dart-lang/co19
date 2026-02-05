// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We allow augment before class, extension type, and mixin
/// declarations. (Enums and extensions are discussed in subsequent sections.)
///
/// @description Checks that it is a syntax error to augment an old-fashioned
/// typedef.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

typedef void Foo();

augment typedef void Foo();
//      ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(Foo);
}
