/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the list satisfy the predicate [f].
 * @description Checks that the method always returns false on an empty list.
 * @author msyabro
 * @reviewer varlax
 */

main() {
  Expect.isFalse([].some((int e) { } ));
  Expect.isFalse([].some((var e) {return false;} ));
  Expect.isFalse([].some((var e) {return true;} ));
  Expect.isFalse([].some((var e) {Expect.fail("Should not be executed");}));
}
