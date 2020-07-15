/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool values
 * @description Checks that [values] return correct value list.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({});
  Iterable a = view.values;
  Expect.isTrue(a.length == 0);

  view = new UnmodifiableMapView({"1" : 1, "2" : 2});
  a = view.values;
  Expect.isTrue(a.length == 2);
  Expect.isTrue(a.contains(1));
  Expect.isTrue(a.contains(2));
}
