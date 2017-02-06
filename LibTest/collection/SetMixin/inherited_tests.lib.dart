/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract class SetMixin<K, V>
 * Mixin implementation of [Set].
 * @description Checks that all members of [Set] are implemented.
 * @author sgrekhov@unipro.ru
 */
library inherited_tests_setmixin;

import "../../core/Set/all_tests.lib.dart" as set_tests;

test(Set create([Iterable content])) {
  set_tests.test(create);
}
