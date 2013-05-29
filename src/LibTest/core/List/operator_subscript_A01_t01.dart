/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E operator [](int index)
 * Returns the element at the given index in the list.
 * @description Checks fixed size arrays.
 * @author iefremov
 * @reviewer msyabro
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
main() {
  Expect.isTrue([1][0] == 1);
  var a = [];
  Expect.identical([a][0], a);
  Expect.identical([null][0], null);
  Expect.isTrue(const<int>[1, 2, 3][0] == 1);
  Expect.isTrue([null, null, null][0] == null);

  Expect.identical([1, 2, 3][0], 1);
  Expect.identical([1, null, 3][1], null);
  Expect.identical([1, 2, null][2], null);
  
  a = const [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17];
  List ls = new List<int>(a.length);
  for (int i in a) {
    Expect.identical(a[i], i);
    ls[i] = a[i];
  }
  for(int i = 0; i < a.length; ++i) {
    Expect.identical(ls[i], i);
    Expect.identical(ls[a.length-1-i], a.length-1-i);
  }
}
