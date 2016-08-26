/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String currentAsString
 * A string containing the current rune.
 * @description Checks that [currentAsString] is final and can't be set (causes
 * compile error in strong mode).
 * @compile-error
 * @author msyabro
 */

main() {
  var it = new RuneIterator('a');
  it.currentAsString = '1';
}