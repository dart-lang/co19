/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the list.
 * @description Tries to pass function [f] without parameters.
 * @author vasya
 * @reviewer iefremov
 * @dynamic-type-error
 * @needsreview undocumented behavior
 */


main() {
  void f() {}
  [1].forEach(f);
}
