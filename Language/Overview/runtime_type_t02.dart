/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The run-time type of every object is represented as an instance
 * of class Type which can be obtained by calling the getter runtimeType 
 * declared in class Object, the root of the Dart class hierarchy.
 * @description Checks that this getter works with null value, because it is an 
 * instance of type Null which extends Object and should inherit runtimeType.
 * @author rodionov
 * @reviewer kaigorodov
 */
import "../../Utils/expect.dart";

main() {
    Expect.isTrue(null.runtimeType is Type);
    // can't test for Null as it's inaccessible at the moment
}
