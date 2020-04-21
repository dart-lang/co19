/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NORM relation defines the canonical representative of classes
 * of equivalent types...
 * This is based on the following equations:
 *   T*? == T?
 *
 * @description Checks that T*? == T?
 *
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import '../type-aliases/legacy_library_aliases_lib.dart';

main() {
  IntAlias? t = 42;
  int? t1 = t;
  int? t2 = 1;
  IntAlias? t3 = t2;
}
