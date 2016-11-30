/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool movePrevious()
 * Move back to the previous element.
 * Returns true and updates current if successful. Returns false and sets
 * current to null if there is no previous element.
 * @description Checks that this method returns true and updates the
 * current if there is a previous element.
 * @author sgrekhov@unipro.ru
 */
library movePrevious_A01_t02;
import "../../../Utils/expect.dart";

test(BidirectionalIterator create([Iterable content])) {
  BidirectionalIterator it = create([0, 1, 2, 3]);

  it.moveNext();
  it.moveNext();

  Expect.isTrue(it.movePrevious());
  Expect.equals(0, it.current);
}
