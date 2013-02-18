/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns -1 if given element is not found. 
 * @description Checks that -1 is returned, if the element is not present.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";


main() {
  List a = [42, 0, -1, 42, -1, 6031769, 0];
  Expect.isTrue(a.indexOf(3.14, 0) == -1);
  Expect.isTrue(a.indexOf(null, 0) == -1);
  Expect.isTrue(a.indexOf(a, 0) == -1);
  Expect.isTrue(a.indexOf(42, 4) == -1);
  Expect.isTrue(a.indexOf(-1, 5) == -1);

  a = const [42, 0, -1, 42, -1, 6031769, 0];
  Expect.isTrue(a.indexOf(3.14, 0) == -1);
  Expect.isTrue(a.indexOf(null, 0) == -1);
  Expect.isTrue(a.indexOf(a, 0) == -1);
  Expect.isTrue(a.indexOf(42, 4) == -1);
  Expect.isTrue(a.indexOf(-1, 5) == -1);

  List b = new List(a.length);
  for(var i = 0; i<a.length; i++) {
    b[i] = a[i];
  }
  Expect.isTrue(b.indexOf(3.14, 0) == -1);
  Expect.isTrue(b.indexOf(null, 0) == -1);
  Expect.isTrue(b.indexOf(a, 0) == -1);
  Expect.isTrue(b.indexOf(42, 4) == -1);
  Expect.isTrue(b.indexOf(-1, 5) == -1);
}
