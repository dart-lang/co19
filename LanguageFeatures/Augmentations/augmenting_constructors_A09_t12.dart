// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that an augmentation of an incomplete primary
/// constructor of a class or an enum may add a metadata.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

const Meta = 1;

class C1(int x) {}

augment class C1 {
  @Meta
  augment C1(int x);
}

class C2.foo(int v);

augment class C2 {
  @Meta
  augment C2.foo(int v);
}

enum E1(int x) {
  e0(0);
}

augment enum E1 {
  ;
  @Meta
  augment const E1(int x);
}

enum E2.foo(int v) {
  e0.foo(0);
}

augment enum E2 {
  ;
  @Meta
  augment const E2.foo(int v);
}

main() {
 C1(1);
 C2.foo(2);
 E1.e0;
 E2.e0;
}
