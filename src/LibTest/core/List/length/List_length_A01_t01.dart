/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Read-only length of the list.
 * @description Checks that the field contains correct value.
 * @author iefremov
 * @reviewer msyabro
 */


main() {
  Expect.isTrue([].length == 0);
  Expect.isTrue([null].length == 1);
  Expect.isTrue([null, null].length == 2);
  Expect.isTrue([0, 1, 2, 3].length == 4);
  List a = [null];
  List b = [a];
  Expect.isTrue(b.length == 1);
}
