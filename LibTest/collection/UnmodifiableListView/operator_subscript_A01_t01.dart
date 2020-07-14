/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E operator [](int index)
 * @description Checks fixed size arrays.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new UnmodifiableListView([1])[0] == 1);
  List a = [];
  Expect.identical(new UnmodifiableListView([a])[0], a);
  Expect.identical(new UnmodifiableListView([null])[0], null);
  Expect.isTrue(new UnmodifiableListView(const<int>[1, 2, 3])[0] == 1);
  Expect.isTrue(new UnmodifiableListView([null, null, null])[0] == null);

  Expect.identical(new UnmodifiableListView([1, 2, 3])[0], 1);
  Expect.identical(new UnmodifiableListView([1, null, 3])[1], null);
  Expect.identical(new UnmodifiableListView([1, 2, null])[2], null);
  
  a = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];
  UnmodifiableListView ls = new UnmodifiableListView(a);
  for(int i = 0; i < a.length; ++i) {
    Expect.identical(ls[i], i);
    Expect.identical(ls[a.length - 1 - i], a.length - 1 - i);
  }
}
