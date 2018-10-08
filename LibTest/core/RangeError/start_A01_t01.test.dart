/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num start
 * read-only
 * The minimum value that value is allowed to assume.
 * @description Checks that this property returns the minimum value that value
 * is allowed to assume
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
test(RangeError create(num invalidValue, int minValue, int maxValue)) {
  Expect.equals(1, create(-1, 1, 3).start);
  Expect.equals(-11, create(-1, -11, 3).start);
  Expect.equals(3, create(0, 3, 22).start);
  Expect.equals(null, create(0, null, 22).start);
}
