/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final T current
 * The current value of the stream.
 * Only valid when the future returned by moveNext completes with true as value,
 * and only until the next call to moveNext.
 * @description Checks that the property returns the current value of the stream.
 * @author kaigorodov
 */

import "dart:async";
import "../../../Utils/expect.dart";

void check(expected) {
  StreamController controller=new StreamController();
  StreamIterator streamIterator=new StreamIterator(controller.stream);
  controller.add(expected);
  streamIterator.moveNext().then((var value){
    Expect.isTrue(value);
    Expect.equals(expected, streamIterator.current);
  });
  controller.close();
}

main() {
  check(null);
  check(12345);
  check("expected");
  check(["expected"]);
}
