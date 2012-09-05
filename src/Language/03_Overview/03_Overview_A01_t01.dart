/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The run-time type of every object is represented as an instance 
 * of class Type which can be obtained by calling the getter runtimeType declared 
 * in class Object, the root of the Dart class hierarchy.
 * @description Checks that this getter indeed returns an instance of class Type
 * that is not null for non-null values of various types and doesn't cause any errors.
 * @author rodionov
 */

main() {
  Expect.isTrue(1.runtimeType is Type);
  Expect.isNotNull(1.runtimeType);
  Expect.isTrue((1.1).runtimeType is Type);
  Expect.isNotNull((1.1).runtimeType);
  Expect.isTrue("foo".runtimeType is Type);
  Expect.isNotNull("foo".runtimeType);
  Expect.isTrue(true.runtimeType is Type);
  Expect.isNotNull(true.runtimeType);
  Expect.isTrue(main.runtimeType is Type);
  Expect.isNotNull(main.runtimeType);
}
