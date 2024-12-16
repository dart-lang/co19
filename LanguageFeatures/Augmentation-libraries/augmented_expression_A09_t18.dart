// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if a declaration with the basename
/// `augmented` occurs in a location where any enclosing declaration is
/// augmenting.
///
/// @description Checks that it is a compile-time error to augment an extension
/// type named `augmented`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

extension type augmented(int _) {}

augment extension type augmented {}
//                     ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(augmented);
}
