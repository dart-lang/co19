// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written T0 <: T1)
/// when:
/// Left Null: if T0 is Null then:
/// - if T1 is a type variable (promoted or not) the query is false
/// - If T1 is FutureOr<S> for some S, then the query is true iff Null <: S.
/// - If T1 is Null, S? or S* for some S, then the query is true.
/// - Otherwise, the query is false
/// @description Check that otherwise, the query is false. Test some legacy class
/// @author sgrekhov@unipro.ru

// Requirements=nnbd-weak
import "../../utils/legacy_lib.dart";

Null t0Instance = null;
X t1Instance = new X();

const t1Default = const X();

//# @T0 = Null
//# @T1 = X
