/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int value returns milliseconds from 1970-01-01T00:00:00Z (UTC). 
 * @description check that returned value is the int
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Expect.isTrue(new Date.now().milliseconds is int);
}
