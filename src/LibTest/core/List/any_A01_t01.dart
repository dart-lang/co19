/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract bool any(bool f(E element))
 * Returns true if one element of this collection satisfies the predicate f.
 * Returns false otherwise.
 * @description Checks that true is returned if one or more elements satisfies
 * the predicate f, false otherwise.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

bool isOne (element) => element==1;

main() {
  List a=new List();
  Expect.isFalse(a.any(isOne));
  a.add(2);
  Expect.isFalse(a.any(isOne));
  a.add(1);
  Expect.isTrue(a.any(isOne));
  a.add(1);
  Expect.isTrue(a.any(isOne));
}
