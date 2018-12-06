/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion List<E> abstract class 
 * @description Checks that List-specific methods work as specified.
 * Tests which consume a lot of memory
 * @author sgrekhov@unipro.ru
 */
import "../../core/List/sort_A01_t08.test.dart" as sort_A01_t08;
import "List_class_A01_t01.dart";

main() {
  sort_A01_t08.test(create);
}
