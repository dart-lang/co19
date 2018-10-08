/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ArgumentError.notNull([String name])
 * Create an argument error for a null argument that must not be null.
 * @description Checks that this constructor can be called without argument
 * @author sgrekhov@unipro.ru
 */

import "../../../Utils/expect.dart";
 
main() {
  ArgumentError err = new ArgumentError.notNull();
  Expect.isNull(null, err.name);
  Expect.equals("Must not be null", err.message);
}
