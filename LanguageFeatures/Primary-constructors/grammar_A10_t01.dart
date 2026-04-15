// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion TODO(sgrekhov): Add an assertion after updating the specification
///
/// @description Check that it is allowed to omit `const` keyword when declaring
/// a generative constructor of an enum.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=primary-constructors

enum E1 {
  e0(1);
  final int x;
  E1(this.x);
}

enum E2 {
  e0;
  E2();
}

enum E3 {
  e0;
  const E3();
  E3.named() : this();
}

main() {
  const c1 = E1.e0;
  const c2 = E2.e0;
  const c3 = E3.e0;
}
