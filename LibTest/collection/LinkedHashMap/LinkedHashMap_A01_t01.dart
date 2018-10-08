/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a map with the default implementation.
 * @description Checks that an empty LinkedHashMap is created
 * @author msyabro
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  LinkedHashMap m = new LinkedHashMap();
  Expect.isTrue(m is LinkedHashMap);
  Expect.isTrue(m.isEmpty);
}
