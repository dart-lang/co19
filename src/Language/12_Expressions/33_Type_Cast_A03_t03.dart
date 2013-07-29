/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If T is malformed the cast always succeeds.
 * This is a consequence of the rule that malformed types are treated as dynamic
 * @description Checks that it is a static warning if an unavailable type
 * is used in a type cast.
 * @static-warning
 * @author rodionov
 * @reviewer iefremov
 */

class G<S extends String, N extends num> {}

main() {
  1 as NonExistent; /// static type warning
  1 as NonExistent<int>; /// static type warning
  1 as List<NonExistent>; /// static type warning
  1 as G<String, bool>; /// static type warning
  1 as List<List<NonExistent>>; /// static type warning
  1 as G<G<String, bool>, int>; /// static type warning
}
