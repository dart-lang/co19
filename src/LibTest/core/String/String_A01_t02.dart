/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The String class represents character strings. Strings are immutable.
 * @description Check that String implements Hashable, Pattern and Comparable
 * @author msyabro
 */


main() {
  String s = new String.fromCharCodes([0x61, 0x62, 0x63]);
  
  Expect.isTrue(s is Hashable);
  Expect.isTrue(s is Comparable);
  Expect.isTrue(s is Pattern);
}
