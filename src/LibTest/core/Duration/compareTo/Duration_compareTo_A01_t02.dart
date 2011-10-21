/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface Duration extends Comparable
 * @description Checks that compareTo() method is implemented correctly.
 * @needsreview Method undocumented 
 * @author rodionov
 * @reviewer msyabro
 */

main() {
  Expect.equals(0, new Duration(1, -4, 0, 61, 0).compareTo(new Duration(0, 20, 1, 1, 0)));
  Expect.equals(0, new Duration(hours: 1).compareTo(new Duration(seconds: 3600)));

  Expect.equals(1, new Duration(0, 0, 0, 0, 1000).compareTo(new Duration(0, 0, 0, 0, 999)));
  Expect.equals(1, new Duration(0, 0, 0, 0, 1001).compareTo(new Duration(0, 0, 0, 1, 0)));
  Expect.equals(1, new Duration(0, 0, 0, 0, 3600001).compareTo(new Duration(0, 1, 0, 0, 0)));
  Expect.equals(1, new Duration(0, 0, 25*60, 0, 0).compareTo(new Duration(1, 0, 0, 0, 0)));

  Expect.equals(-1, new Duration(0, 0, 0, 0, 999).compareTo(new Duration(0, 0, 0, 1, 0)));
  Expect.equals(-1, new Duration(0, 0, 0, 1, 0).compareTo(new Duration(0, 0, 0, 0, 1001)));
  Expect.equals(-1, new Duration(0, 1, 0, 0, 0).compareTo(new Duration(0, 0, 0, 0, 3600001)));
  Expect.equals(-1, new Duration(1, 0, 0, 0, 0).compareTo(new Duration(0, 0, 25*60, 0, 0)));
}
