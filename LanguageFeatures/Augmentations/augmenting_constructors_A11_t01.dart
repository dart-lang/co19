// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Check that an incomplete constructor can be augmented by adding
/// a body. Test the case when `new` is used as a constructor name.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,primary-constructors

import '../../Utils/expect.dart';

class C {
  int? v;
  new();
}

augment class C {
  augment new() {
    v = 1;
  }
}

extension type ET._(int v) {
  new(int v);
}

String log = "";

augment extension type ET {
  augment new(this.v) {
    log = "Called";
  }
}

main() {
  Expect.equals(1, C().v);
  ET(0);
  Expect.equals("Called", log);
}
