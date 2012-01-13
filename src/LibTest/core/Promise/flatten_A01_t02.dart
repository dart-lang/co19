/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Promise flatten()
 * Converts this promise so that its result is a non-promise value. For
 * instance, if this promise is of type Promise<Promise<Promise<T>>>,
 * flatten returns a Promise<T>.
 * @description Checks calling [:flatten():] on a promise that returns non-promise value
 * @author msyabro
 */


main() {
  Promise p = new Promise<int>();
  Promise flat = p.flatten();
  p.complete(1);
  Expect.isTrue(flat.isDone());
  Expect.equals(1, flat.value);
}

