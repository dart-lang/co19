// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that an extension type `ET<T1, ..., Ts>` is a subtype of
/// an extension type `ET<X1, ..., Xs>` if `Ti` is a subtype of `Xi` for all
/// `i`. Test union types.
/// @author sgrekhov22@gmail.com
/// @issue 55578

import "dart:async";

extension type ET(Future<int> _) implements Future<int> {}

FutureOr<int> t1Instance = Future<int>(() => 1);
ET t0Instance = ET(Future<int>(() => 2));

const t1Default = 42;

//# @T0 = ET
//# @T1 = FutureOr<int>
