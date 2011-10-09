/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void forEach(void f(T element))
 * Applies the function [f] to each element of the collection.
 * @description Try to pass a function with empty parameter list to forEach().
 * @dynamic-type-error
 * @author pagolubev
 * @needsreview java crash
 * @reviewer msyabro
 */


main() {
  Set<int> s = new Set<int>();
  s.addAll([1, 2]);

  s.forEach(void f() {});
}
