/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Calling a redirecting factory constructor k causes the constructor k'
 * denoted by type (respectively, type.identifier) to be called with the actual arguments
 * passed to k, and returns the result of k' as the result of k. The resulting constructor
 * call is governed by the same rules as an instance creation expression using new.
 * It is a compile-time error if a redirecting factory constructor redirects to 
 * itself, either directly or indirectly via a sequence of redirections.
 * It is a static warning if type does not denote a class accessible in the current
 * scope; if type does denote such a class C it is a static warning if the referenced
 * constructor (be it type or type.id) is not a constructor of C.
 * It is a compile-time error if k is prefixed with the const modifier but k'
 * is not a constant constructor.
 * It is a static warning if the function type of k' is not a subtype of the type
 * of k.
 * It is a static type warning if any of the type arguments to k' 
 * are not subtypes of the bounds of the corresponding formal type parameters of type.
 * @description TODO: placeholder for actual tests
 * @author rodionov
 * @needsreview
 */

main() {
  //TODO:
}
