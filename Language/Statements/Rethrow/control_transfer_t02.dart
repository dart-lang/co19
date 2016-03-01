/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, control is transferred to the nearest innermost
 * enclosing exception handler.
 * @description Checks that control is transferred to the nearest innermost
 * enclosing exception handler.
 * @author kaigorodov
 */
import '../../../Utils/expect.dart';

var obj = "foo";
var seen = null;

void f0() {
  throw obj;
}

void f1() {
  try {
    f0();
  } on String catch (ok) {
    rethrow;
  }
}

void f2() {
  try {
    f1();
  } on String catch (ok) {
    seen = ok;
  }
}

main() {
  try {
	f2();
  } on String catch (bad) {
    Expect.fail("wrong handler");
  }
  Expect.identical(obj, seen);
}
