/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Interface DateTime extends Comparable.
 * @description Checks DateTime.compareTo() implementaion.
 * @author hlodvig
 * @reviewer iefremov
 */


main() {
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 0);

  Expect.isTrue(new DateTime(2001, 8, 19, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 19, 0, 0, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2001, 9, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 9, 18, 0, 0, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2002, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2002, 8, 18, 0, 0, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2001, 9, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 19, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 19, 0, 0, 0, 0).compareTo(new DateTime(2001, 9, 18, 0, 0, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2002, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 19, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 19, 0, 0, 0, 0).compareTo(new DateTime(2002, 8, 18, 0, 0, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2002, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 9, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 9, 18, 0, 0, 0, 0).compareTo(new DateTime(2002, 8, 18, 0, 0, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2001, 8, 18, 1, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 1, 0, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2001, 8, 18, 1, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 1, 0, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2001, 8, 18, 0, 1, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 1, 0, 0)) == -1);

  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 1, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 1, 0)) == -1);

  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 1).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 0)) == 1);
  Expect.isTrue(new DateTime(2001, 8, 18, 0, 0, 0, 0).compareTo(new DateTime(2001, 8, 18, 0, 0, 0, 1)) == -1);
}
