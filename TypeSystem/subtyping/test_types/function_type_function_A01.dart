// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Function Type/Function: T0 is a function type and T1 is Function
/// @description Check that if type T0 is a function type and T1 is Function then
/// T0 is a subtype of T1. Test void function without actual arguments
/// @author sgrekhov@unipro.ru

typedef void T0();

void t0Instance() {}
Function t1Instance = () {};

void foo() {}
const t1Default = foo;

//# @T0 = T0
//# @T1 = Function
