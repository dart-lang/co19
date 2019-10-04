/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion From the Unified collections spec:
 * In other words, at least one key-value pair anywhere in the collection forces
 * it to be a map, and a bare expression forces it to be a set. Having both is
 * an error.
 * @description Checks that there cannot be bare element and key-value pair in
 * the same collection.
 * @compile-error
 * @author iarkh@unipro.ru
 */

main() {
  List aList = [8, 9, 10];
  Map aMap = {1: 2};
  var res = {...?aMap, ...?aList};
}
