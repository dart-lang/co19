/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The null object is the sole instance of the built-in class Null.
 * @description Checks that null is an instance of the Null class.
 * @author ilya
 */

import '../../../Utils/expect.dart';

main() {
  Expect.isTrue("Null", null.runtimeType.toString());
}
