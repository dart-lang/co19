// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Augmenting a constructor works similarly to augmenting a function,
/// with some extra rules to handle features unique to constructors, like
/// redirections and initializer lists, and the primary constructor syntax.
///
/// @description Check that an incomplete constructor can be augmented by adding
/// a body. Test the case when the constructor is declared using the keyword
/// `new`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

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
