// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// ...
/// - The resulting constructor is not valid (has a redirecting initializer and
///   other initializers, multiple super initializers, etc).
///
/// @description Checks that it is a compile-time error if the resulting
/// constructor has a redirecting initializer and other initializers.
/// @author sgrekhov22@gmail.com
/// @issue 57029

// SharedOptions=--enable-experiment=macros

class A {
  int x;
  A([this.x = 0]);
}

class C extends A {
  C(): super();
//^^^
// [analyzer] unspecified
// [cfe] unspecified
}

augment class C {
  augment C(): super(1);
}

main() {
  print(C);
}
