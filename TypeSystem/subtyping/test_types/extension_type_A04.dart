// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that DV declares an extension type declaration named Name with type
/// parameters X1 .. Xs, and V1 is a superinterface of DV. Then Name<T1, .. Ts>
/// is a subtype of [T1/X1 .. Ts/Xs]V1 for all T1, .. Ts.
///
/// @description Check that if type `T0` is an extension type `V` with type
/// parameters `X1 .. Xs`, and `V1` is a superinterface of `V`, then `V` is a
/// subtype of `[T1/X1 .. Ts/Xs]V1` for all `T1, .. Ts`.
/// @author sgrekhov22@gmail.com

extension type const V1<T1, T2>(T1 id) {}

extension type V<T1, T2>(T1 id) implements V1<T1, T2> {}

V1<num, Object> t1Instance = V1<num, Object>(0);
V<int, String> t0Instance = V<int, String>(42);

const t1Default = const V1<num, Object>(0);

//# @T0 = V<int, String>
//# @T1 = V1<num, Object>
