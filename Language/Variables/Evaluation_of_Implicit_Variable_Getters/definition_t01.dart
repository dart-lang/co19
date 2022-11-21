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
/// @description Checks the result of the getter and that the initializer
/// expression is evaluated only once.
/// @author msyabro

import "../../../Utils/expect.dart";

String log = "";

writeLog(int i) {
  log = "${log}${i}";
  return i;
}

class C {
  static var a = writeLog(1);
  static int b = writeLog(2);
  static final c = writeLog(3);
  static final int d = writeLog(4);
}

main() {
  Expect.equals(4, C.d);
  Expect.equals(1, C.a);
  Expect.equals(2, C.b);
  Expect.equals(3, C.c);

  Expect.equals("4123", log, "Lazy static getters execution was wrong!");
}
