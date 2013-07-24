/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  It is a compile-time error if the key of an entry in a constant map 
 *  literal not a constant string, number, boolean, list or map, or null.
 * @description Checks that there is no compile-time error if the key is constant list.
 * @author hlodvig
 * @needsreview 11255
 */

main() {
  var arr = const {const [1, 2]: 1};
}
