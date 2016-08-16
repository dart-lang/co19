/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion  A type T is malformed iff:
 * • T has the form id or the form prefix.id, and in the enclosing lexical
 *   scope, the name id (respectively prefix.id) does not denote a type.
 * • T denotes a type variable in the enclosing lexical scope, but occurs in
 *   the signature or body of a static member.
 * • T is a parameterized type of the form G<S1, ..., Sn>, and G is malformed.
 * • T denotes declarations that were imported from multiple imports clauses.
 * Any use of a malformed type gives rise to a static warning. A malformed type
 * is then interpreted as dynamic by the static type checker and the runtime
 * unless explicitly specified otherwise.
 * @description Checks that type name imported from multiple import clauses
 * that refers to different type declarations causes to a compile error
 * when used in type annotation.
 * @compile-error
 * @author ilya
 */

import "../somelib1.dart"; // class C {}
import "../somelib2.dart"; // class C {}

main() {
  C c;
}
