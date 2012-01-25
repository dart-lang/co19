/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion T get value()
 * The value once it is computed. It will be null when the promise is in
 * progress ([: !isDone() :]), when it was cancelled ([: isCancelled() :]), or
 * when the computed value is actually null.
 * @description Checks [: value :] when [: complete() :] is called after [: cancel() :].
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Case is not documented. See also complete/A01/t04. Issue 232.
 */


main() {
  Promise p = new Promise();
  p.cancel();
  p.complete(-1);
  Expect.isTrue(p.isCancelled());
  Expect.equals(null, p.value);
}


