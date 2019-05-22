/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter is considered to be a malformed type when
 * referenced by a static member.
 * @description Checks that if a type parameter is used as type annotation
 * in a static context, it is a compile error to assign to such member
 * @compile-error
 * @author iefremov
 */

class C<T> {
  static T t;
}

main() {
  C.t = new Object();
}
