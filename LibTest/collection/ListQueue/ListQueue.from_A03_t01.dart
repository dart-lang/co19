/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory ListQueue.from(Iterable elements)
 * All elements should be assignable to [E].
 * @description Checks that elements can be only of [E] type.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Expect.throws(() {
      ListQueue list = new ListQueue<int>.from([1, 2, 3, "4", 5]);
    }, (e) => e is TypeError || e is CastError
  );

  Expect.throws(() {
      ListQueue list = new ListQueue<int>.from([1, 2, 1.14, 4, 5]);
    }, (e) => e is TypeError || e is CastError
  );

  Expect.throws(() {
    ListQueue list = new ListQueue<int>.from([1, 2, new Object(), 4, 5]);
  }, (e) => e is TypeError || e is CastError
  );
}
