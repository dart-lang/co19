/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> abstract class 
 * Implements Iterable<E>
 * @description Run Iterable tests
 * @author sgrekhov@unipro.ru
 */
library inherited_set_tests;
import "set.lib.dart";
import "../../core/Iterable/allTests.lib.dart" as iterable_tests;

test(Iterable create([Iterable content])) {
  iterable_tests.test(create, isSet:true);
}

main() {
  test(create);
}
