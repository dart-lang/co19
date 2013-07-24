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
import "../../../Utils/expect.dart";
main() {
  int e = 1;
  try {
    e(); /// static type warning
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(ok) {}

  try {
    ("String1")(null, null); /// static type warning
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}

  try {
    [](); /// static type warning
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}

  try {
    false(); /// static type warning
    Expect.fail("NoSuchMethodError is expected");
  } on NoSuchMethodError catch(e) {}
}
