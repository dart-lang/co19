// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's a compile-time error if an augmentation is complete and any
/// declaration before it in the augmentation chain is also complete.
///
/// @description Checks that it is a compile-time error to declare an augmenting
/// redirecting generative constructor if an introductory constructor has a body
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

part 'augmenting_constructors_A18_t06_lib.dart';

class C {
  C() {}
  C.foo() {}
}

augment class C {
  augment C.foo() : this();
//                  ^
// [analyzer] unspecified
// [cfe] unspecified
}

extension type ET(int x) {
  ET.foo(int x) {}
}

augment extension type ET {
  augment ET.foo(int x) : this(x);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(ET);
}
