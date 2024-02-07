// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Legacy if T0 is S0* then:
/// - T0 <: T1 iff S0 <: T1.
/// @description Check that if type T0 is S0* and S0 <: T1 then T0 is subtype of
/// T1.
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";
class S0 {}

var t0Instance = getLegacyType<S0>(new S0());
Object t1Instance = new Object();

const t1Default = const Object();

//# @T0 = S0
//# @T1 = Object
