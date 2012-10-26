/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion There is no requirement that the expression e evaluate to a special
 * kind of exception or error object.
 * @description Checks that values of various types can be thrown.
 * @author kaigorodov
 */

main() {
  var last = -1;
  try {
    throw last;
  } catch(e) {
    Expect.equals(last, e);
  }

  last = {"1" : 1, "2" : 2, "3" : 3, "4" : 4};
  try {
    throw last;
  } catch(e) {
    Expect.equals(last, e);
  }

  last = void func() => null;
  try {
    throw last;
  } catch(e) {
    Expect.equals(last, e);
  }
}
