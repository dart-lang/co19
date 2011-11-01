/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String toString() returns a human readable string for this instance. 
 * @description check that returned value is String
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Expect.isTrue(new Date.now().toString() is String);
}
