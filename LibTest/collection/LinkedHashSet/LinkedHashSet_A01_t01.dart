/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion LinkedHashSet()
 * Creates an empty Set.
 * The created Set is a HashSet. As such, it considers elements that are equal
 * (using ==) to be undistinguishable, and requires them to have a compatible
 * Object.hashCode implementation.
 * @description Checks that an empty LinkedHashSet is created
 * @author msyabro
 * @reviewer pagolubev
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  LinkedHashSet set = new LinkedHashSet();
  Expect.isTrue(set is LinkedHashSet);
  Expect.isTrue(set.isEmpty);
}
