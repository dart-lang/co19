/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */

library unqualified_invocation_lib;
import '../../../../Utils/expect.dart';

m(p1) {
  Expect.equals("ab", p1);
  return 0;
}
