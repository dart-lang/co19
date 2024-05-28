// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Other declarations: top-level variables, top-level function
/// names, type names, member names, etc. are unchanged. They can be named `_`
/// as they are today.
///
/// @description Checks that it is no error or warning to declare a covariant
/// formal parameter named `_`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

class C1 {
  void foo(covariant num _) {}
  void bar([covariant num _ = 0]) {}
}

class C2 extends C1 {
  void foo(int _) {}
  void bar([Object _ = ""]) {}
}

mixin M {
  void foo(covariant num _) {}
  void bar([covariant num _ = 0]) {}
}

enum E {
  e0;
  void foo(covariant num _) {}
  void bar([covariant num _ = 0]) {}
}

class MA = Object with M;

main() {
  C1().foo(3.14);
  C1().bar();
  C2().foo(42);
  C2().bar("42");
  MA().foo(3.14);
  MA().bar();
  E.e0.foo(3.14);
  E.e0.bar();
}
