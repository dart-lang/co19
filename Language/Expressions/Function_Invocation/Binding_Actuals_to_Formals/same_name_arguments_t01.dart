/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if qi = qj for any i != j.
 * @description Checks that it is a compile-time error if there are two
 * named arguments with the same name in a function invocation expression.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

func({int np1, int np2, int np3}) {}

main() {
  try {
    func(np1: 1, np2: 2, np2: 2);
  } catch (e) {}
}
