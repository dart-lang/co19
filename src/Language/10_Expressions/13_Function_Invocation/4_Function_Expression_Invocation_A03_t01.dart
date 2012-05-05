/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a static warning if the static type F of ef may not
 * be assigned to a function type.
 * @description Checks that it is a static warning if the static type F of ef may not
 * be assigned to a function type.
 * @static-warning
 * @author msyabro
 * @reviewer rodionov
 */

f() {
  return {"key": "value"};
}

main() {
  int e = 1;
  try {
    e();
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException ok) {}

  try {
    ("String1")(null, null);
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}

  try {
    []();
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}

  try {
    null(p1: 1);
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}

  try {
    new Object()();
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}

  try {
    f()();
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}

  try {
    false();
    Expect.fail("NoSuchMethodException is expected");
  } catch(NoSuchMethodException e) {}
}
