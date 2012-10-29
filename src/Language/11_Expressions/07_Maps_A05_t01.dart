/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a run-time error to attempt to modify a constant map literal.
 * @description Checks that it is a run-time error to attempt to modify a constant map literal.
 * @author msyabro
 * @note the assertion is removed from the spec.
 * @needsreview Issue 1553
 * @reviewer kaigorodov
 */

main() {
  bool b;
  try {
    b = false;
    (const {})["1"] = 2;
    b = true;
  } catch(e) {}
  if(b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const {"k1": 1}).remove("k1");
    b = true;
  } catch(e) {}
  if(b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const {"k1": 1})["k1"] = 0;
    b = true;
  } catch(e) {}
  if(b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const {"k1" : 1, "k2": false}).clear();
    b = true;
  } catch(e) {}
  if(b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const {}).clear();
    Expect.fail("Exception is expected");
    b = true;
  } catch(e) {}
  if(b) Expect.fail("Exception is expected");
}
