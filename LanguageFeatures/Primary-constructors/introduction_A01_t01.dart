// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error to specify the modifier `var` on the
/// representation variable.
///
/// @description Check that it is a compile-time error to specify the modifier
/// `var` on the representation variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

extension type ET1(var int v) {}
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

extension type ET2(var int _);
//                 ^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(ET1);
  print(ET2);
}
