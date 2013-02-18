/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Assigns the index'th element of the list to the given value.
 * @description Checks that needed element is correctly assigned in extendable lists. 
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  List a = new List();
  a.length = 2;
  a[0] = 1;
  Expect.identical(1, a[0]);
  a[0] = null;
  Expect.isTrue(null == a[0]);
  a[0] = a;
  Expect.identical(a, a[0]);

  a = new List.from([1,2,3]);
  a[1] = null;
  Expect.listEquals([1, null, 3], a);
  a[2] = null;
  Expect.listEquals([1, null, null], a);
  a[0] = null;
  Expect.listEquals([null, null, null], a);
  a[1] = 100500;
  Expect.listEquals([null, 100500, null], a);
}
