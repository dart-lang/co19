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
/// @description Check that extension type `V` is not a subtype of its
/// representation type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type const V(int id) {}

V t1Instance = V(42);
int t0Instance = 0;

const t1Default = const V(42);

//# @T0 = int
//# @T1 = V
