/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An if statement of the form if (b)s1 is equivalent to the
 * if statement if (b)s1 else {}.
 * @description Checks that the result of executing an if statement with and
 * without an empty else clause is the same.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';

f_if(v) {
  if (v) {
    return 1;
  }
}

f_if_else(v) {
  if (v) {
    return 1;
  } else {}
}

main() {
  Expect.equals(f_if(true), f_if_else(true));
  Expect.equals(f_if(false), f_if_else(false));
}
