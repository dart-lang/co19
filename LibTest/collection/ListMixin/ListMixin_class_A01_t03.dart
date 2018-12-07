/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ListMixin<E> abstract class 
 * Implements List<E>
 * @description Checks that List-specific methods work as specified.
 * Tests which consume a lot of memory
 * @author sgrekhov@unipro.ru
 */
import "../../core/List/sort_A01_t05.test.dart" as sort_A01_t05;
import "listmixin_lib.dart";

main() {
  sort_A01_t05.test(create);
}
