// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It's not an error to read potentially assigned local variable in
/// the form var x;
///
/// @description Checks that it's not an error to read potentially assigned local
/// variable in the form var x;. Test indirect read via triple shift compound
/// assignment
///
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import '../../../Utils/expect.dart';

main() {
  bool b = true;
  var x;
  if (b) {
    x = 42;
  }
  x >>>= 2;
  Expect.equals(42 >>> 2, x);

  var y;
  b = false;
  if (b) {
    y = 42;
  }
  Expect.throws(() {y >>>= 2;});
}
