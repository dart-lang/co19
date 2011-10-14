/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new list of the given length.
 * @description Checks that an expandable list is created if [length] is null
 * @author iefremov
 * @reviewer msyabro
 * @needsreview
 */

main() {
  List list = new List(null);
  list.add(1);//increase the length of the list
  list.add(2);
  list.add(3);
  list.length = 0; //decrease the length of the list
}
