// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Check that an incomplete constructor can be augmented by adding
/// an initializer list. Test the case when `new` is used as a constructor name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C {
  int v;
  new();
}

augment class C {
  augment new() : v = 1;
}

enum E {
  e0;

  final int v;
  new();
}

augment enum E {
  ;
  augment new() : v = 1;
}

extension type ET._(int v) {
  new(int v);
}

augment extension type ET {
  augment new(this.v) : assert(v > 0);
}

main() {
  Expect.equals(1, C().v);
  Expect.equals(1, E.e0.v);
  ET(0);
}
