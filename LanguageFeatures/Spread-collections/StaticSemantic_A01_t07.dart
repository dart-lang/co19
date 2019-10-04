/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion (Unified collections)
 * It is a compile-time error if:
 * ...
 * A spread element in a list or set has a static type that implements
 * [Iterable<T>] for some [T] and [T] is not assignable to the element type of
 * the list.
 * @description Checks that compile error appears if [T] is not assignable to
 * the element type.
 * @compile-error
 * @author iarkh@unipro.ru
 */

main() {
  var strings = <String>[];
  var res = <int>{11, ...strings};
}
