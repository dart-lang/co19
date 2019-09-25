/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Right Top: T1 is a top type (i.e. Object?, dynamic, or void)
 * @description Check that if type T1 is an Object then T0 is a subtype of a
 * type T1
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
class T0 {}

T0 t0Instance = new T0();
Object? t1Instance = new Object();

const t1Default = null;

//# @T0 = T0
//# @T1 = Object?
