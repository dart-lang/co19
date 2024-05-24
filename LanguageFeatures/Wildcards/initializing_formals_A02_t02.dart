// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion No parameter with the name `_` is bound, which means `_` can't be
/// accessed inside the initializer list. The name `_` can be used in the body,
/// but this is a reference to the field, not to the parameter
///
/// @description Checks that a class member named `_` can be initialized in the
/// initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=wildcard-variables

import '../../Utils/expect.dart';

class C {
  int _, a;
  C(this.a) : _ = a;
}

main() {
  Expect.equals(42, C(42)._);
}
