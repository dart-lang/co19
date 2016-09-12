/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion class SplayTreeSet<E>
 * A Set of objects that can be ordered relative to each other.
 * Mixes-in IterableMixin<E> SetMixin<E>
 * @description Checks that all members of [IterableMixin] and [SetMixin] are
 * implemented.
 * @author sgrekhov@unipro.ru
 */
library inherited_tests_splaytreeset;

import "dart:collection";
import "../SetMixin/inherited_tests.lib.dart" as set_mixin_tests;
import "../IterableMixin/inherited_tests.lib.dart" as iterable_mixin_tests;

test(Set create([Iterable content])) {
  set_mixin_tests.test(create);
  iterable_mixin_tests.test(create, isSet: true);
}
