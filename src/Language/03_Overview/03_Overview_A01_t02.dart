/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The run-time type of every object is represented as an instance 
 * of class Type which can be obtained by calling the getter runtimeType declared 
 * in class Object, the root of the Dart class hierarchy.
 * @description Checks that this getter causes a NullPointerException when invoked
 * on a null value.
 * @author rodionov
 */

main() {
  try {
    Type bottom = null.runtimeType;
    Expect.fail("NullPointerException expected");
  } on NullPointerException {//ok
  }
}
