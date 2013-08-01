/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predeﬁned Dart function identical() is deﬁned such that identical(c1, c2) iff:
 *   c1 evaluates to either null, an instance of bool, int, String and c1 == c2.
 * @description Checks that two null constants are identical iff they are equal.
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

const x = null;

main() {
  Expect.isTrue(identical(x, null));
}
