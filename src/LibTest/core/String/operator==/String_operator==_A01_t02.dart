/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the two strings are equal.
 * @description Try to compare String with another types
 * @author msyabro
 */


main() {
  Expect.isTrue(!("1" == 1));
  Expect.isTrue(!("" == null));
  Expect.isTrue(!("true" == true));
}
