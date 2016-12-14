/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool operator ==(other)
 * The equality operator.
 *
 * The default behavior for all Objects is to return true if and only if this
 * and other are the same object.
 *
 * Override this method to specify a different equality relation on a class.
 * The overriding method must still be an equivalence relation. That is, it must
 * be:
 * ...
 * Reflexive: For all objects o, o == o must be true.
 * ...
 * @description Checks that for all objects o, o == o is true.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  const o1 = const Object();
  Object o2 = new Object();

  Expect.isTrue(o1 == o1);
  Expect.isTrue(o2 == o2);
}
