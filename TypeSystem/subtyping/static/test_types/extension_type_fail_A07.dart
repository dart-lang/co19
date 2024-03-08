// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// Assume that T1, .. Ts are types, and V resolves to an extension type
/// declaration of the following form:
///
/// extension type V<X1 extends B1, .. Xs extends Bs>(T id) ... {
///   ... // Members.
/// }
/// It is then allowed to use V<T1, .. Tk> as a type.
///
/// @description Check that if type `T0` is an extension type `V` with a
/// nullable representation type then `Object?` is not subtype of `V`
/// @author sgrekhov22@gmail.com

extension type const V<T>(T id) {}

V<Object?> t1Instance = V<Object?>(42);
Object? t0Instance = null;

const t1Default = const V<Object?>(0);

//# @T0 = Object?
//# @T1 = V<Object?>
