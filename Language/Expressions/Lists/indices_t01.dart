/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  A list has an associated set of indices. An empty list has an
 * empty set of indices. A non-empty list has the index set {0 … n - 1} where n
 * is the size of the list.
 * It is a runtime error to attempt to access a list using an index that is not
 * a member of its set of indices.
 * @description Checks that it is a runtime error to attempt to access a list
 * using an index that is not a member of its set of indices.
 * @author msyabro
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.throws(() {
    [][0];
  });

  Expect.throws(() {
    [][-7];
  });

  Expect.throws(() {
    [1, 2, 3, 4][-10];
  });

}
