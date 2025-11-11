// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A class, mixin class, or extension type declaration whose body is
/// `;` is treated as the corresponding declaration whose body is `{}` and
/// otherwise the same. This rule is not applicable to a
/// `<mixinApplicationClass>` (for instance, `class B = A with M;`).
///
/// @description Check that it is a compile-time error to declare a mixin whose
/// body is `;`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=declaring-constructors

mixin M;
//     ^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(M);
}
