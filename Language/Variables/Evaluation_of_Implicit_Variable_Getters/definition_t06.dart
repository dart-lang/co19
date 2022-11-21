// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
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
/// @note The language specification says 'If, during the evaluation of [e]
/// (which is the initializing expression for [v]), the getter for [v] is invoked,
/// a [CyclicInitializationError] is thrown', but this is overridden by the
/// following text in the nnbd feature specification: 'If a variable or field is
/// read from during the process of evaluating its own initializer expression,
/// and no write to the variable has occurred, the read is treated as a first
/// read and the initializer expression is evaluated again.'
/// So CyclicInitializationErrors are gone here when null safety is enabled.
/// In the test, [f] returns [null] (typed as [dynamic]), and the evaluation of
/// the initializing expression for [sVar] as well as [sFinal] discards the
/// function literal (() => sVar respectively () => sFinal) without ever
/// executing it. So we do not have a situation where the getter for
/// [sVar]/[sFinal] is invoked during the evaluation of its initializing
/// expression, and both variables just get initialized to the value [null]. No
/// recursion and no errors.
///
/// @description Checks that [CyclicInitializationError] is not thrown with null
/// safety turned on.
///
/// @author sgrekhov@unipro.ru
/// @issue 46086

f(func) {}

class C {
  static var sVar = f(() => sVar);
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified

  static final sFinal = f(() => sFinal);
//             ^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  C? c;
}
