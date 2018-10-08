/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion num end
 * read-only
 * The maximum value that value is allowed to assume.
 * @description Checks that this property returns the maximum value that value
 * is allowed to assume
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
 
test(RangeError create(num invalidValue, int minValue, int maxValue)) {
  Expect.equals(3, create(-1, 1, 3).end);
  Expect.equals(13, create(-1, -11, 13).end);
  Expect.equals(22, create(0, 3, 22).end);
  Expect.equals(null, create(0, 3, null).end);
}
