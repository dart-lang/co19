// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error to declare a constructor in a
/// mixin-declaration.
///
/// @description Checks that mixin declaration doesn't allow constructors. Test
/// factory constructor.
/// @author sgrekhov@unipro.ru
/// @issue 24767
/// @issue 34804

class I {}
class J {}

class B {}
class C {}

mixin M on B, C implements I, J {
  factory M() = MA;
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class A implements B, C, I, J {}

class MA extends A with M {}

main() {
  print(M);
}
