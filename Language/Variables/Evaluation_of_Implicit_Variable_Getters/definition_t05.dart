// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Let d be the declaration of a variable v.  If d is a local or
/// instance variable, then the invocation of the implicit getter of v
/// evaluates to the value stored in v.
/// If d is a static or library variable then the implicit getter method of v
/// executes as follows:
/// - Non-constant variable declaration with initializer. If d is of one of the 
///   forms var v = e; , T v = e; , final v = e; , final T v = e; , static 
///   v = e; , static T v = e; , static final v = e;  or static final T v = e; 
///   and no value has yet been stored into v then the initializer expression 
///   e is evaluated. If, during the evaluation of e, the getter for v is
///   invoked, a CyclicInitializationError is thrown. If the evaluation 
///   succeeded yielding an object o, let r = o, otherwise let r = null. In 
///   any case, r is stored into v. The result of executing the getter is r.
/// - Constant variable declaration. If d is of one of the forms const v = e; ,
///   const T v = e; , static const v = e;  or static const T v = e; the result
///   of the getter is the value of the compile time constant e. Note that a
///   compile time constant cannot depend on itself, so no cyclic references 
///   can occur. Otherwise
/// - Variable declaration without initializer. The result of executing the
///   getter method is the value stored in v.
///
/// @note NNBD Spec now reads: If a variable or field is read from during the
/// process of evaluating its own initializer expression, and no write to the
/// variable has occurred, the read is treated as a first read and the
/// nitializer expression is evaluated again.
///
/// A toplevel or static variable with an initializer is evaluated as if it was
/// marked [late]. Note that this is a change from pre-NNBD semantics in that:
///
/// Reading the variable during initializer evaluation is no longer checked for,
/// and does not cause an error.
///
/// @description Checks that an error is not thrown when getter is referenced
/// during evaluation of initialization expression.
/// @author kaigorodov
/// @Issue 42470
/// @issue 42642

import "../../../Utils/expect.dart";

int count = 0;

int f() {
  return count++ < 20 ? C.sTyped : count;
}

class C {
  static int sTyped = f();
}

main() {
  Expect.equals (21, C.sTyped);
}
