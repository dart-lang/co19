/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns the index'th element in the array.
 * @description Checks retriving by zero index.
 * @author iefremov
 * @reviewer msyabro
 */




main() {
  Expect.isTrue([1][0] == 1);
  var a = [];
  Expect.isTrue([a][0] === a);
  Expect.isTrue([null][0] === null);
  Expect.isTrue([1, 2, 3][0] == 1);
  Expect.isTrue([null, null, null][0] == null);
}
