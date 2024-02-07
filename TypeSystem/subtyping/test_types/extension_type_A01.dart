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
/// @description Check that if type `T0` is an extension type `V<T1, .. Ts>` and
/// `T1` is an extension type `V<X1, .. Ss>` then `T0` is a subtype of `T1` if
/// all `Ti <: Xi`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type const V<T1 extends num, T2 extends Object>(T1 id) {}

V<num, Object> t1Instance = V<num, num>(3.14);
V<int, String> t0Instance = V<int, String>(42);

const t1Default = const V<num, Object>(0);

//# @T0 = V<int, String>
//# @T1 = V<num, Object>
