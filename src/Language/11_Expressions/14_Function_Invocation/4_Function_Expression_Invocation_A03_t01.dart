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
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(ok) {}

  try {
    ("String1")(null, null);
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}

  try {
    []();
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}

  try {
    null(p1: 1);
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}

  try {
    new Object()();
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}

  try {
    f()();
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}

  try {
    false();
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}
}
