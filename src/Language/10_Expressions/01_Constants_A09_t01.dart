/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A constant map literal is a constant expression.
 * @description Checks that a constant map literal can be assigned to a static final variable
 * and is, therefore, a constant expression.
 * @author iefremov
 * @reviewer rodionov
 */

final x = const {"a" : 1, "b" : 2};

main() {
  Expect.equals(x["a"], 1);
}
