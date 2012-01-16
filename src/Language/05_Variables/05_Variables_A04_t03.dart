/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A static variable is a variable that is not associated with a 
 * particular instance, but rather with an entire library or class. 
 * @description Checks that a static variable is associated with a library.
 * @author vasya
 * @reviewer kaigorodov
 */

#import("library.dart", prefix : "lib");  // Defines top level variable 'foo'

main() {
  Expect.equals("foo", lib.foo);
}

