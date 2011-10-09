/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Interface DateTime extends Comparable.
 * @description Checks that DateTime is Comparable and has .compareTo() method.
 * @author hlodvig
 * @reviewer iefremov
 */


main() {
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0) is Comparable);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 0);
}
