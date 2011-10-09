/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns this collection as a set.
 * @description Try to pass not initialized array to this method.
 * @author vasya
 * @reviewer iefremov
 * @needsreview
 */


main() {
  Array a = new Array(5);
  Set s = a.toSet();
}
