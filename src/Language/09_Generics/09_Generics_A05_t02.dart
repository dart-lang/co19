/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error to refer to a type parameter from within a static member.
 * @description Checks that it is a compile-time error to reference a type
 * parameter from static context (as a type annotation) and there's no static warning.
 * @compile-error
 * @author iefremov
 * @reviewer kaigorodov
 * @issue 5230
 */

class C<T> {
  static T t;
}

main() {
  try {
    C.t = new Object();
  } catch(ex) {}
}
