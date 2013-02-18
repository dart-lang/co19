/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The implicit interface of class I is a direct supertype 
 * of the implicit interface of class J if I is Object, and J has no extends clause.
 * @description Checks that Object is a supertype of an an implicit interface of a class
 * that extends no other types.
 * @author iefremov
 * @reviewer rodionov
 * @needsreview It's currently impossible to check whether a type is a "direct supertype" of another
 * without some sort of reflection framework.
 */
import "../../Utils/expect.dart";

class J {}

main() {
  Expect.isTrue(new J() is Object);
}
