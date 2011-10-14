/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if some elements of the list satisfy the predicate [f].
 * @description Passes function which is not applicable to the element type.
 * @author vasya
 * @dynamic-type-error
 * @reviewer msyabro
 */

main() {
  [1,2,3].some(bool f(bool e) { return true;} );
}
