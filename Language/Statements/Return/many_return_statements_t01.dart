// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Executing a return statement with no expression, `return;`
/// returns without an object.
///
/// @description Checks that it is not an error if a function has both `return;`
/// and `return e;` statements.
/// @author ilya
/// @issue 39476

import '../../../Utils/expect.dart';

f(bool x) {
  if (x) {
    return 1;
  } else {
    return;
  }
}

get g {
  if (1 > 2) {
    return 1;
  } else {
    return;
  }
}

class C {
  static staticF(bool x) {
    if (x) {
      return 1;
    } else {
      return;
    }
  }

  static get staticG {
    if (1 > 2) {
      return 1;
    } else {
      return;
    }
  }
  instanceF(bool x) {
    if (x) {
      return 1;
    } else {
      return;
    }
  }

  get instanceG {
    if (1 > 2) {
      return 1;
    } else {
      return;
    }
  }
}

main() {
  Expect.isNull(f(false));
  Expect.isNull(g);
  Expect.isNull(C.staticF(false));
  Expect.isNull(C.staticG);
  Expect.isNull(C().instanceF(false));
  Expect.isNull(C().instanceG);
}
