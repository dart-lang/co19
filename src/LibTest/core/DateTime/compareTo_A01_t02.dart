/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int compareTo(DateTime other)
 * Compares this object to another Comparable
 * Returns a value like a Comparator when comparing this to other.
 * @description Checks DateTime.compareTo() implementation.
 * @author hlodvig
 * @reviewer iefremov
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";


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
