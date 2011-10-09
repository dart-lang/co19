/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A named optional parameter may have an explicit default 
 * value. If a default value is not provided explicitly, it is null.
 * @description Checks default value of named optional parameter.
 * @author iefremov
 * @reviewer pagolubev
 */



static int f([int x = 42]) {
  return x;
}

void main() {
   Expect.isTrue(f() == 42;);
   Expect.isTrue(f(6031769) == 6031769);
}
