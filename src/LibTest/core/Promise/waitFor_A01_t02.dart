/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void waitFor(Collection<Promise> arr, int n)
 * Mark this promise as complete when [n] promises in [arr] complete, then
 * cancel the rest of the promises in [arr] that didn't complete.
 * @description Checks that fail of a promise from an 'arr' will call
 * [:fail():] on 'this'.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Though such behavior is not specified, current implementation
 * inherits it from [:join():]. Issue 232.
 */


main() {
  // checks fail()
  var p = new Promise();

  var promises = [new Promise(), new Promise(), new Promise()];
  
  p.waitFor(promises, 2);

  promises[1].fail(-5);

  Expect.equals(p.error, -5);
}
