/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E elementAt(int index)
 * Returns the indexth element.
 * @description Checks that the indexth element is returned.
 * @author kaigorodov
 */
library elementAt_A01_t01;

import "../../../Utils/expect.dart";

test(Iterable create([Iterable content])) {
  List a=create();
  List b=[5, 4, 3, 2, 1, 0];
  a.addAll(b);
  for (int k=0; k<a.length; k++) {
    Expect.equals(b[k], a.elementAt(k));
  }
}
