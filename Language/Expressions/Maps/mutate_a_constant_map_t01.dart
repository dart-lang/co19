/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Attempting to mutate a constant map literal will result in
 * a dynamic error.
 * @description Checks that it is a run-time error to attempt to modify a
 * constant map literal.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  bool b;
  try {
    b = false;
    (const {})["1"] = 2;
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const {"k1": 1}).remove("k1");
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const {"k1": 1})["k1"] = 0;
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const {"k1" : 1, "k2": false}).clear();
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const {}).clear();
    Expect.fail("Exception is expected");
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");
}
