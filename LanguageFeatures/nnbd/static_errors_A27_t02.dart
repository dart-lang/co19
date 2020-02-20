/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error if the object being iterated over by a for-in loop
 * has a static type which is not dynamic, and is not a subtype of
 * Iterable<dynamic>
 *
 * @description Check that it is no error if the object being iterated over by a
 * for-in loop has a static type which is dynamic, or a subtype of
 * Iterable<dynamic>
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong

class C {
}

main() {
  C c = C();
  dynamic d = [c, Object()];
  List<C> list1 = [C(), C(), C()];
  List<C?> list2 = [C(), null, C()];

  for (var o in d) {}
  for (C c in list1) {}
  for (C? c in list2) {}
  for (var o in [Object(), Object()]) {}
  for (var o in [Object(), null, c]) {}
}
