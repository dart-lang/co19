/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   T?* == T?
 *
 * @description Checks that T?* == T?
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import 'opted_out_lib.dart';

main() {
  var t = getLegacyType<int?>(null);
  int? t1 = t;
  t = t1;
}
