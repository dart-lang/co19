/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new isolate-template for a light isolate.
 * @description Checks that an isolate is created.
 * @author msyabro
 * @reviewer kaigorodov
 */

#import('dart:isolate');

void main() {
  var isolate = new Isolate.light();
  Expect.isTrue(isolate is Isolate);
}