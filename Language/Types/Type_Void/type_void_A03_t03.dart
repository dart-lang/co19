// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The special type `void` is used to indicate that the value of an
/// expression is meaningless and intended to be discarded.
///
/// @description Checks that it is a compile-time error to use `void` or its
/// alias in a mixin `on` clause, but it is not an error to use it in the
/// on-type of an extension.
/// @author sgrekhov22@gmail.com

typedef Void = void;

mixin M1 on void {}
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M2 on Void {}
//          ^^^^
// [analyzer] unspecified
// [cfe] unspecified

extension Ext1 on void {} // Extensions are allowed on every type, including void
extension Ext2 on Void {}

main() {
  print(M1);
  print(M2);
}
