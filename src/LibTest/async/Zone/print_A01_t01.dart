/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract void print(String line)
 * Prints the given line.
 * @description Checks that member function print exists that accepts String
 * @author ilya
 */

import "dart:async";

main() {
  Zone.current.print('print supported');
}
