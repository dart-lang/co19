// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is a compile-time error if the augmenting
/// redirecting factory constructor introduce default values.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  int x;
  C([this.x = 0]);
  C.n({this.x = 0});
  factory C.foo([int x]);
  factory C.bar({int x});
}

augment class C {
  augment factory C.foo([int x = 0]) = C.new;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory C.bar({int x = 0}) = C.n;
//                             ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  factory ET.foo([int? x]) => ET.new(0);
  factory ET.bar({int? x}) => ET.new(0);
  factory ET.baz([int? x]) = ET.foo;
  factory ET.qux({int? x}) = ET.bar;
}

augment extension type ET {
  augment factory ET.baz([int? x = 0]);
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
  augment factory ET.qux({int? x = 0});
//                               ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
