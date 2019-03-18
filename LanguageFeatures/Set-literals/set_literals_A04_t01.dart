/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of s is Set<T>.
 *
 * @description Checks that the static type of s is Set<T>.
 * @author sgrekhov@unipro.ru
 */
test<T>(Set<T> s) {}

main() {
  test<int>({3, 1, 4, 1, 5, 9, 2, 6});
  test<int>(const {3, 1, 4, 5, 9, 2, 6,});

  test<Object>({'3', 1, 4, 1, 5, 9, 2, 6, bool});
  test<Object>(const {'3', 1, 4, 5, 9, 2, 6, bool,});

  dynamic d;
  test<dynamic>({'3', 1, 4, 1, 5, 9, 2, 6, d});
}
