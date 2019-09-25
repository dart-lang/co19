/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Function Type/Function: T0 is a function type and T1 is Function
 * @description Check that if type T0 is a function type and T1 is Function then
 * T0 is a subtype of T1. Test non-void function with positional arguments
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class C {}

typedef C T0(C c, [dynamic d]);

C t0Instance(C c, [dynamic d]) => c;
Function t1Instance = () {};

void foo() {}
const t1Default = foo;

//# @T0 = T0
//# @T1 = Function
