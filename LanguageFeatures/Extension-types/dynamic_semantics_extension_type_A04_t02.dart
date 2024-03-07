// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V used as an expression (a type literal)
/// evaluates to the value of the extension type erasure of the representation
/// type used as an expression
///
/// @description Check that it is a compile-time error if an extension type and
/// its representation type are used in the same constant collection
/// @author sgrekhov22@gmail.com
/// @issue 53918

extension type ET(int id) {}

main() {
  const testSet = {int, ET};
//                      ^^
// [analyzer] unspecified
// [cfe] unspecified
  const testMap = {int: 1, ET: 2};
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
}
