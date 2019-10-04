/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To infer the type of element:
 * ...
 * If element is a spreadElement with expression e1:
 *
 * If P is ? then let S be the inferred type of e1 in context ?:
 * ...
 * If none of these cases match, it is an error.
 *
 * @description Checks that if it is a compile error if non of the cases
 * (`Iterable<Object>` nor of `Map<Object, Object>`, and it's also not `dynamic`
 * nor `Null`) match
 * @compile-error
 * @author sgrekhov@unipro.ru
 */

Set<X> foo<X>(Set<X> s) => s;

void test<T>(T t) {
  var s = foo({...?t});
}

main() {
  test<Null>(null);
}
