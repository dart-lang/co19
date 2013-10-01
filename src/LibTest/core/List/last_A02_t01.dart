/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final E last
 * If this is empty throws a StateError.
 * @description Checks that StateError is thrown if the list is empty.
 * @author kaigorodov
 */
import "../Iterable/last_A02_t01.lib.dart";
import "test.lib.dart";

main() {
  test(create);  
}
