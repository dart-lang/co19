/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new isolate-template for a heavy isolate.
 * @description Checks that an isolate is created.
 * @author msyabro
 * @reviewer kaigorodov
 */

void main() {
  var isolate = new Isolate.heavy();
  Expect.isTrue(isolate is Isolate);
}