/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter is considered to be a malformed type when referenced by a static member.
 * @description Checks that it is dynamic type error in checked mode to reference a type parameter 
 * from static context (as a type annotation) and there's no static warning.
 * @author iefremov
 * @reviewer kaigorodov
 * @issue 5230
 */
import "../../Utils/dynamic_check.dart";

class C<T> {
  static T t;
}

main() {
  checkTypeError(() {C.t = new Object();});
}
