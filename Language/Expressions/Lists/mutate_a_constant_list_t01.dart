/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Attempting to mutate a constant list literal will result in a
 * dynamic error.
 * @description Checks that it is a run-time error to attempt to modify
 * a constant list literal.
 * @author msyabro
 * @needsreview Issue 1553
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  bool b;
  try {
    b = false;
    (const []).add(1);
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const [1, 2, 3])[0] = 5;
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const [true, false]).removeLast();
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const [""]).clear();
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const []).clear();
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");

  try {
    b = false;
    (const []).add(1);
    b = true;
  } catch (e) {}
  if (b) Expect.fail("Exception is expected");
}
