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
}

augment class C {
  augment C() : this();
//              ^
// [analyzer] unspecified
// [cfe] unspecified
  augment C.foo() : this.foo();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

enum E {
  e0;
  const E();
  const E.foo();
}

augment enum E {
  ;
  augment const E() : this();
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment const E.foo() : this.foo();
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int v) {
  ET.foo(int v);
}

augment extension type ET {
  augment ET(int v) : this.foo(v);
//                    ^
// [analyzer] unspecified
// [cfe] unspecified
  augment ET.foo(int v) : this(v);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(E);
  print(ET);
}
