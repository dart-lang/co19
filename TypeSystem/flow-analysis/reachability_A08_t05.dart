// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Variable or getter: If N is an expression of the form x where the
/// type of x is T then:
///
/// If T <: Never then:
///  Let null(N) = unreachable(before(N)).
///  Let notNull(N) = unreachable(before(N)).
/// Otherwise if T <: Null then:
///  Let null(N) = before(N).
///  Let notNull(N) = unreachable(before(N)).
/// Otherwise if T is non-nullable then:
///  Let null(N) = unreachable(before(N)).
///  Let notNull(N) = before(N).
///
/// @description Checks reachability after variable or getter. Test getter of
/// non-nullable type
/// @author sgrekhov@unipro.ru
/// @issue 41981

// Requirements=nnbd-strong

import "../../Utils/expect.dart";

String get s => "Lily was here";

main() {
  late int i;
  if (s == null) {
    i = 42; // `i` is not definitely unassigned because in a weak mode the
            // condition may be true
  }
  try {
    i;
    Expect.fail("Error expected");
  } on Error catch(e) {
    // Ok
  }
}
