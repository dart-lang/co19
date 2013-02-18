/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void addAll(Collection<T> collection)
 * Adds all the elements of the given collection to the set.
 * @description Passes a list containing null to addAll(), expects no errors.
 * @author pagolubev
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();

  s.addAll([null]);
  s.addAll([1, 2, null]);
}
