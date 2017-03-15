/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int length
 * @description Checks that length property contains correct size of the map.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  UnmodifiableMapView view = new UnmodifiableMapView({1 : 1, 2 : 23, 37 : 49});
  Expect.equals(3, view.length);

  view = new UnmodifiableMapView({});
  Expect.equals(0, view.length);
}
