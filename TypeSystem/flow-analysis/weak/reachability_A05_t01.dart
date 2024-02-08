// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion other literal: If N is some other literal than the above, then:
///  Let null(N) = unreachable(before(N)).
///  Let notNull(N) = before(N)
///
/// @description Checks reachability after string literal
/// @author sgrekhov@unipro.ru
/// @issue 41985

// Requirements=nnbd-weak

import "../../../Utils/expect.dart";

main() {
  late int i;
  if ("Lily was here" == null) {
    i = 42;   // `i` is not definitely unassigned because in a weak mode the
              // condition may be true
  }
  try {
    i;
    Expect.fail("Error expected");
  } on Error catch(e) {
    // Ok
  }
}
