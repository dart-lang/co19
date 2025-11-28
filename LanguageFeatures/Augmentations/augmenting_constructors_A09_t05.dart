// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An incomplete constructor can be completed by adding an
/// initializer list and/or a body, or by adding a redirection.
///
/// @description Checks that augmenting non-redirecting factory constructor may
/// add a body to an introductory factory constructor.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  int x;
  C(this.x);
  factory C.foo();
}

augment class C {
  augment factory C.foo() => C(0);
}

extension type ET(int id) {
  factory ET.foo();
}

augment extension type ET {
  augment factory ET.foo() => ET(0);
}

main() {
  Expect.equals(0, C.foo().x);
  Expect.equals(0, ET.foo().id);
}
