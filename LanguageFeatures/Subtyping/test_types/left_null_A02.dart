/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
 * when:
 * Left Null: T0 is Null.
 * @description Check that if type T0 is Null and T1 is dynamic then T0 is a
 * subtype of a type T1.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
Null t0Instance = null;
Null t1Instance = null;

const t1Default = null;

//# @T0 = Null
//# @T1 = Null
