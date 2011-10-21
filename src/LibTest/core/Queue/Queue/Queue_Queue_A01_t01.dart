/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates empty queue.
 * @description Checks that empty queue is created.
 * @author msyabro
 * @reviewer varlax
 */


main() {
  Queue list = new Queue();
  Expect.isTrue(list.isEmpty());
}
