/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set.identity()
 * Creates an empty identity Set.
 * The created Set is a LinkedHashSet that uses identity as equality relation.
 * The set is equivalent to one created by new LinkedHashSet<E>.identity().
 * @description Checks that created hash set is LinkedHashSet
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  Set set = new Set.identity();
  Expect.isTrue(set is LinkedHashSet);
}
