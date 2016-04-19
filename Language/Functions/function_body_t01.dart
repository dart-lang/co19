/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The body is a block statement containing the statements
 * executed by the function.
 *
 * @description Checks that the statements are executed by the function.
 *
 * @author msyabro
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

main() {
  int n = 0;
  void func() {
    n++;
  }

  for (int i = 1; i <= 10; i++) {
    func();
    Expect.equals(i, n);
  }
}
