/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The predeﬁned Dart function identical() is deﬁned such that
 * identical(c1, c2) iff:
 *  • c1 and c2 are the same object.
 * @description Checks that an object is identical() to itself.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

List o1 = new List(10);
List o2 = new List(10);

main() {
  Expect.isTrue(identical(o1, o1));
  Expect.isTrue(identical(o2, o2));

  Expect.isFalse(identical(o1, o2));
}
