/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion qualified:
 *   identifier ('.' identifier)?
 * ;
 * @description Checks qualified identifiers
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

import '../lib.dart' as lib;

main() {
  Expect.isTrue(lib.x == 1);
  Expect.isTrue(lib.A.y == null);
}
