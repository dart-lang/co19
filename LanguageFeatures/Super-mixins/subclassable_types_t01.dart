/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A mixin declaration defines an interface. The interface for this
 * mixin declaration is equivalent to the interface of the class declared as:
 *  abstract class A<X extends S, Y extends T> extends A$super<X, Y>
 *    implements D, E { body' }
 * where body' contains abstract declarations corresponding to the instance
 * members of body of the mixin A.
 * . . .
 * This again means that the types of the implements clause must be subclassable
 * class types.
 *
 * @description Checks that types that from implements clause must be
 * subclassable class types.
 * @compile-error
 * @author ngl@unipro.ru
 */
typedef F = void Function(num);

class B {}
class C {}

mixin M1 on B, C implements void {}   //# 01: compile-time error
mixin M2 on B, C implements dynamic {}   //# 02: compile-time error
mixin M3 on B, C implements FutureOr<List> {} //# 03: compile-time error
mixin M4 on B, C implements F {}    //# 04: compile-time error
mixin M5 on B, C implements int {}  //# 05: compile-time error
mixin M6 on B, C implements bool {} //# 06: compile-time error
mixin M7 on B, C implements Null {} //# 07: compile-time error

main() {
}
