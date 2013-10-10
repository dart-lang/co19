/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract int indexOf(E element, [int start = 0])
 * Throws exception if [index] is of invalid type or null.
 * @note undocumented
 * @description Checks that the exception is thrown as expected.
 * @author varlax
 * @reviewer iefremov
 */
import "../../../Utils/expect.dart";

import "../../../Utils/dynamic_check.dart";

check(List a) {
  Expect.throws( () {
    var idx = 0.1;
    a.indexOf(1,idx);
  });

  Expect.throws( () {
    var idx = '32';
    a.indexOf(1,idx);
  });

  Expect.throws( () {
    a.indexOf(1,null);
  });
}

void main() {
  if(isCheckedMode()) {
    return;
  }
  check(const [null]);
  check(['sd','sd']);
  check(new List.from(<int>[null, 1, 0]));
  check(new List(100));
}
