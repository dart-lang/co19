/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract dynamic operator [](Symbol key)
 * Retrieves the zone-value associated with key.
 * If this zone does not contain the value looks up the same key in the 
 * parent zone. If the key is not found returns null.
 * @description Check that operator[] returns expected values.
 * @author ilya
 */

import "dart:async";
import "../../../Utils/expect.dart";

main() {
  Zone.current.fork(zoneValues: {#a:1, #b:2}).run(() {
    Expect.equals(1, Zone.current[#a]);
    Expect.equals(2, Zone.current[#b]);
    Zone.current.fork(zoneValues: {#a:11}).run(() {
      Expect.equals(11, Zone.current[#a]);
      Expect.equals(2, Zone.current[#b]);
      Expect.equals(1, Zone.current.parent[#a]);
      Expect.isNull(Zone.current[#c]);
    });
  });
}
