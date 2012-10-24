/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the [Iterator] has elements left.
 * @description Checks that [Iterator] has no elements left when the list is cleared.
 * @author msyabro
 * @reviewer varlax
 * @needsreview implementation specific
 */

main() {
  Queue list = new Queue.from([0,1,2,3,4,5]);
  Iterator it = list.iterator();
  list.clear();
  Expect.isFalse(it.hasNext);
}
