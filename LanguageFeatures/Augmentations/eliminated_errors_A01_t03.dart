// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With this feature, it is no longer an error to have the following
/// situations:
/// - An `implements` clause contains two or more type operands denoting the
///   same type.
///
/// @description Checks that it is still a compile-time error if an after all
/// augmentations applied a declaration has two superinterfaces that are
/// different instantiations of the same generic class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class I<T> {}

class C implements I {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
augment class C implements I<String> {}

mixin M implements I<int> {}
//    ^
// [analyzer] unspecified
// [cfe] unspecified
augment mixin M implements I<String> {}

enum E implements I<int> {
//   ^
// [analyzer] unspecified
// [cfe] unspecified
  e0;
}
augment enum E implements I {;}

extension type ET(I<int> _) implements I<num> {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified
augment extension type ET implements I<Object> {}

class MA = Object with M;

main() {
  print(C);
  print(M);
  print(E);
  print(ET);
}
