// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Check that an incomplete factory constructor can be completed.
/// Test the case when `factory` is used instead of the class name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C1 {
  int v;
  C1.create(this.v);

  factory();
}

augment class C1 {
  augment factory() => C1.create(1);
}

class C2 {
  final int v;
  const C2.create(this.v);

  const factory(int v);
}

augment class C2 {
  augment const factory(int v) = C2.create;
}

extension type ET1.create(int v) {
  factory();
}

augment extension type ET1 {
  augment factory() => ET1.create(1);
}

extension type const ET2.create(int v) {
  const factory ET2(int v);
}

augment extension type ET2 {
  augment const factory ET2(int v) = ET2.create;
}

main() {
  Expect.equals(1, C1().v);
  Expect.equals(2, C2(2).v);
  Expect.equals(1, ET1().v);
  Expect.equals(2, ET2(2).v);
}
