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
 * @description Checks that the property returns provided value.
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 */


main() {
  Promise p = new Promise();
  p.complete(-13);
  Expect.equals(p.value, -13);

  p = new Promise.fromValue(-2);
  Expect.equals(p.value, -2);

  p = new Promise();
  p.complete(null);
  Expect.equals(p.value, null);

  p = new Promise.fromValue(null);
  Expect.equals(p.value, null);
}

  
