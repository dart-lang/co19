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
 * @description Checks that failing a promise does not affect the flatten promise
 * @author msyabro
 * @needsreview Undocumented behavior. Do we need such tests?
 */


main() {
  var depth = 10;
  var p = new Promise();
  var flat = p.flatten();
  var current = p;

  for (int i = 0; i < depth; i++) {
    var tmp = new Promise();
    current.complete(tmp);
    current = tmp;
  }

  current.fail(-1);
  Expect.isFalse(flat.hasError());
  Expect.isFalse(flat.isDone());
}

