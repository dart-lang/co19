// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's not a compile error to read definitely unassigned local
/// variable in the form var x;
///
/// @description Checks that it's not a compile error to read definitely
/// unassigned local variable in the form var x;.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  var x1;
  Expect.isNull(x1);
}
