/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The effect of a type alias of the form
 * typedef T id(T1 p1, ..., Tn pn, [Tn+1 pn+1, ..., Tn+k pn+k]) declared in a library L
 * is is to introduce the name id into the scope of L, bound to the function type
 * (T1, ..., Tn, [Tn+1 pn+1, ..., Tn+k pn+k ]) -> T.
 * @description Checks that self-referencing typedef is allowed (positional formal parameter
 * type annotation has the same name as a type alias).
 * @author iefremov
 */

typedef f(f x);

main() {
  var func = _(f x){};
}
