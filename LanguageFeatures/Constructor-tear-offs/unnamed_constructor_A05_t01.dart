// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With regard to tear-offs, [C.new] works exactly as if it had been
/// a named constructor, with a corresponding constructor function named
/// [C.new$tearoff].
///
/// @description Check that [C.new] tearing off works exactly as a corresponding
/// construction function named [C.new$tearoff].
/// @author iarkh@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

import "../../Utils/expect.dart";

class C {
  C() {}
}

main() {
  Expect.isTrue(C.new is C Function());
  Expect.runtimeIsType<C Function()>(C.new);
}