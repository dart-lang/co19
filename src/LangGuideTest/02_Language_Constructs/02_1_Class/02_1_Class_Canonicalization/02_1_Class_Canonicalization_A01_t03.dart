/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Canonicalization occurs for all constant expressions. Two objects are
 * canonicalized, if they have the same class, and if all their fields are triple-equal
 * @description Checks canonicalization of arrays.
 * @author iefremov
 * @reviewer msyabro
 */


main() {
  Expect.isTrue(const [] === const []);
  Expect.isTrue(const [1] === const [1]);
  Expect.isTrue(const [""] === const [""]);
  Expect.isTrue(const [1, "a", null] === const [1, "a", null]);
}
