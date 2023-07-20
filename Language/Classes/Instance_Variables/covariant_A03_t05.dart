// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is possible for the declaration of an instance variable to
/// include the modifier covariant. The effect of this is that the formal
/// parameter of the corresponding implicitly induced setter is considered to be
/// covariant-by-declaration
///
/// @description Checks that if an instance variable is declared as covariant
/// then the corresponding implicitly induced setter is covariant-by-declaration
/// @author sgrekhov22@gmail.com

class A {
  num v = 1;
}

mixin class I {
  covariant int v = 3;
}

class C1 extends A implements I {
  int get v => 2;
  void set v(int val) {}
}

class C2 extends A with I {
  void set v(int val) {}
}

main() {
  print(C1);
  print(C2);
}
