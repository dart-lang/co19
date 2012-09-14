/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double NAN
 * @description Checks that type of NAN is double
 * @author hlodvig
 */


main() {
  Expect.isFalse(double.NAN is int);
  Expect.isTrue(double.NAN is double);
  Expect.isTrue(double.NAN is num);
}
