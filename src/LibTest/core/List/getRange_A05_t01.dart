/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract Iterable<E> getRange(int start, int end)
 * It is an error if the start and end are not valid ranges at the time of the call to this method. The returned Iterable behaves similar to skip(start).take(end - start). That is, it will not throw exceptions if this changes size.
 * @description Checks that an [Error] is thrown if [start] or [length] is null.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

void check(List l, int start, int length) {
  try {
    l.getRange(start, length);
    Expect.fail("Error expected when calling List.getRange()");
  } on Error catch(ok) {}   
}

main() {
  check(new List(1),null,1);
  check(new List(1),0,null);
  check(new List(1),0,null);

  check([1],null,1);
  check([1],0,null);
  check([1],0,null);

  check(const [1],null,1);
  check(const [1],0,null);
  check(const [1],0,null);
}
