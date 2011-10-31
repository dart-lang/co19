/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Converts [other] to a string and creates a new string by
 *            concatenating this string with the converted [other].
 * @description Checks that this operator works correctly with a null argument
 * @reviewer pagolubev
 * @author rodionov
 */

main() {
  Expect.isTrue("string" + null == "stringnull");
}
