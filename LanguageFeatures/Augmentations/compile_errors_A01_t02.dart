// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The general rule is that compile-time errors apply to semantic
/// definitions whenever possible. In other words, if the library is
/// syntactically well-formed enough that augmentations can be applied, then
/// they should be. And if doing so eliminates what would otherwise be a
/// compile-time error, then that error should not be reported.
///
/// @description Checks that it is a compile-time error if a merged constructor
/// is cyclic.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

class C {
  C();
  C.foo();
  C.bar();
}

augment class C {
  augment C(): this.foo();
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo(): this.bar();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.bar(): this();
//                 ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  const E();
  const E.foo();
  const E.bar();
}

augment enum E {
  ;
  augment const E(): this.foo();
//                   ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo(): this.bar();
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.bar(): this();
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(int x);
  ET.bar(int x);
}

augment extension type ET {
  augment ET.new(int x): this.foo(x);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(int x): this.bar(x);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.bar(int x): this(x);
//                       ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
