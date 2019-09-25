/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Reflexivity: T0 and T1 are the same type.
 * @description Check that if type T1 and T0 are both Object then T0 is a
 * subtype of a type T1
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
Object t0Instance = new Object();
Object t1Instance = new Object();

const t1Default = const Object();

//# @T0 = Object
//# @T1 = Object
