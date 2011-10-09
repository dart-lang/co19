/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the array.
 * @description Try to pass null function.
 * @author vasya
 * @reviewer iefremov
 * @needsreview
 */


main() {
  try {
    [1].forEach(null);
    Expect.fail("ObjectNotCosureException expected");
  } catch(ObjectNotClosureException e) {}
}
