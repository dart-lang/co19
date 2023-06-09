// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an inline class declaration DV has a member named n
/// in the case where DV declares a member named n, and in the case where DV has
/// no such declaration, but DV has a direct superinterface V that has a member
/// named n. In both cases, the member declaration named n that DV has is said
/// declaration.
///
/// @description Checks that if inline class `V` has a superinterface with a
/// member `m` then this member is also presents in `V`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import "../../Utils/expect.dart";

inline class V1 {
  final int id = 0;
  V1();
}

inline class V implements V1 {
  V();
}

main() {
  Expect.equals(0, V().id);
}
