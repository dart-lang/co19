// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion At a high level, a non-redirecting generative constructor marked
/// `augment` may:
/// - Augment the constructor with an additional constructor body (bodies are
///   invoked in augmentation order, starting at the introductory declaration).
///
/// @description Checks that it is a compile-time error if an introductory
/// constructor accesses local variables defined in an augmenting constructor
/// and vice versa.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

class C {
  C() {
    int x = 0;
    print(y);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment class C {
  augment C() {
    int y = 0;
    print(x);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

extension type ET(int id) {
  ET.foo(this.id) {
    int x = 0;
    print(y);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

augment extension type ET {
  augment ET.foo(this.id) {
    int y = 0;
    print(x);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  print(C);
  print(ET);
}
