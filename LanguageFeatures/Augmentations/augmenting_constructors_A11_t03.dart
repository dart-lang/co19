// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Check that an incomplete constructor can be augmented by adding
/// initializing formals. Test the case when the constructor is declared using
/// the keyword `new`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C {
  int v;
  new(int v);
}

augment class C {
  augment new(this.v);
}

enum E {
  e0(0);

  final int v;
  const new(int v);
}

augment enum E {
  ;
  augment const new(this.v);
}

extension type ET._(int v) {
  const new(int v);
}

augment extension type ET {
  augment const new(this.v);
}

main() {
  Expect.equals(1, C(1).v);
  Expect.equals(0, E.e0.v);
  ET(0);
}
