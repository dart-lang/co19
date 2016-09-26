/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of a map literal of the form
 * const <K, V>{k1: e1...kn: en} or the form <K, V>{k1: e1...kn: en} is
 * Map<K, V>.
 * @description Checks that a compile error occurs when assigning a constant
 * map literal to an int variable.
 * @compile-error
 * @author msyabro
 * @reviewer iefremov
 */

main() {
  int i = const <String, String> {};
}
