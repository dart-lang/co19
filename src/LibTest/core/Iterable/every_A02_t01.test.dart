/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If this collection is empty, returns true.
 * @needsreview not documented
 * @description Checks that method always returns true on an empty list.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer msyabro
 * @reviewer varlax
 */
library elementAt_A02_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  Expect.isTrue(create().every((var v) {return false;}));
}
