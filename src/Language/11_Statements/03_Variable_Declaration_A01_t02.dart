/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A variable declaration statement T id; or T id = e; introduces 
 * a new variable id with static type T into the innermost enclosing scope.
 * @description Checks several assignments of variables declared as "T id = e;"
 * that are correct in checked mode and do not produce static warnings.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */

#import("../../Utils/dynamic_check.dart");

class S {}
class T extends S {}
class C extends T {}

main() {
  T id = new T();

  checkTypeError(() {
    id = new S();
  });
  id = new C();

  bool id1 = false;
  id1 = true;
  
  String id2 = null;
  id2 = "";
}

