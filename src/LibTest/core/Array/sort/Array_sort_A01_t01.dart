/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Sorts the array according to the order specified by the comparator.
 * The comparator function [compare] must take two arguments [a] and [b]
 * and return
 *   an integer strictly less than 0 if a < b,
 *   0 if a = b, and
 *   an integer strictly greater than 0 if a > b.
 * @description Sort empty array without comparator
 * @author iefremov
 * @reviewer msyabro
 * @needsreview Add tests for wrong type of the argument
 */




main() {
  [].sort(null);    
}
