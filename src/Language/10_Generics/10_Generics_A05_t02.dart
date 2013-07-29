/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A type parameter is considered to be a malformed type when referenced by a static member.
 * @description Checks that it is a static warning when a type parameter is referenced
 * from static context (as a type annotation).
 * @static-warning
 * @author iefremov
 * @reviewer kaigorodov
 */

class C<T> {
  static T t; // static (not type) warning here: type variable in static context
}

main() {
  C.t = new Object();;
}
