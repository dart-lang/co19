/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the length is null or not specified, creates an expandable list of 0 length.
 * @description Checks that an expandable list is created if [length] is null
 * @author iefremov
 * @author varlax
 * @reviewer msyabro
 * @reviewer varlax
 */

main() {
  List list = new List(null);
  Expect.equals(0, list.length);
  list.add(1);//increase the length of the list
  list.add(2);
  list.add(3);
  Expect.equals(3, list.length);
  list.length = 0; //decrease the length of the list

  List<String> list2 = new List<String>();
  Expect.equals(0, list2.length);
  list2.add('a');//increase the length of the list
  list2.add('a');
  list2.add('a');
  Expect.equals(3, list2.length);
  list2.length = 0; //decrease the length of the list
}
