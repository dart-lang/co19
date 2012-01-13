/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void complete(T value)
 * Provide the computed value; throws an exception if a value has already been
 * provided or the promise previously completed with an error; ignored if the
 * promise was cancelled.
 * @description Checks that [: complete() :] throws an exception if the promise
 * was constructed using [: Promise.fromValue() :].
 * @author pagolubev
 * @reviewer msyabro
 * @reviewer kaigorodov
 * @needsreview Exception type is not specified.
 */


main() {
  Promise p = new Promise.fromValue(5);

  try {
    p.complete(-1);
    Expect.fail("Expected exception.");
  } catch (var e) {}
}

