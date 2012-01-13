/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the list.
 * @description Checks that no exception is thrown if the list is empty.
 * @author iefremov
 * @reviewer pagolubev
 */


main() {
  [].forEach(null);
  [].forEach(void f(var v){});
}
