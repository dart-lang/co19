// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's not an error to read definitely assigned local variable in
/// the form var x;
///
/// @description Checks that it's not an error to read definitely assigned local
/// variable in the form var x;. Test indirect read via triple shift compound
/// assignment
/// @author sgrekhov@unipro.ru

import '../../Utils/expect.dart';

main() {
  var x;
  x = 42;
  x >>>= 2;
  Expect.equals(42 >>> 2, x);
}
