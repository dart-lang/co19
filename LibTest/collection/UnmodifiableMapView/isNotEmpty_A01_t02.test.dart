/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isNotEmpty
 * @description Check that [isNotEmpty] is a read-only property.
 * @author iarkh@unipro.ru
 */
import "dart:collection";
import "../../../Utils/expect.dart";

main() {
  dynamic view = new UnmodifiableMapView({1 : 1, 2 : 23, 37 : 49});
  Expect.throws(() { view.isNotEmpty = 1; }, (e) => e is NoSuchMethodError);
}
