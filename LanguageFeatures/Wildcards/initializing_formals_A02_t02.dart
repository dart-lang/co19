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

class C1 {
  int _, a;
  C1(this.a) : _ = a;
  C1.n(this.a, int _) : _ = a;
}

class C2 {
  final int _, a;
  const C2(this.a) : _ = a;
  const C2.n(this.a, int _) : _ = a;
}

main() {
  Expect.equals(42, C1(42)._);
  Expect.equals(42, C1.n(42, 0)._);
  Expect.equals(42, const C2(42)._);
  Expect.equals(42, const C2.n(42, 0)._);
}
