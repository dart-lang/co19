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
 * @description Checks that promise returned by [:flatten():] is completed
 * with first non-promise value.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  var depth = 10;
  var p = new Promise();
  var flat = p.flatten();
  var current = p;

  for (int i = 0; i < depth; i++) {
    var tmp = new Promise();
    current.complete(tmp);
    Expect.isFalse(flat.isDone());
    current = tmp;
  }

  current.complete(2);
  Expect.isTrue(flat.isDone());
  Expect.equals(flat.value, 2);
}

