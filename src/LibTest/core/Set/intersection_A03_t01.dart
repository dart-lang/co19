/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Set<E> intersection(Collection<E> other)
 * @description Checks that null elements don't cause any errors.
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  new Set.from([1, 2, 3, 4]).intersection([null].toSet());
  new Set.from([1, 2, 3, 4]).intersection([null, 1].toSet());
}
