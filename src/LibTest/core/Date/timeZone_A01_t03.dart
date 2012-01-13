/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final TimeZone timeZone returns the timeZone of this instance.
 * @description Checks that the returned value is the TimeZone
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Expect.isTrue(new Date.now().timeZone is TimeZone);
}
