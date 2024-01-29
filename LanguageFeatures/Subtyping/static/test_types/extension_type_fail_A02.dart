// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
///
/// Here is an overview of the subtype relationships of an extension type V0
/// with instantiated representation type R and instantiated superinterface
/// types V1 .. Vk, as well as other typing relationships involving V0
/// ...
/// V0 is a proper subtype of each of V1 .. Vk
///
/// @description Check that if a type `T1` is an extension type `V0`
/// and `T0` is a superinterface of `V0` then `T0` is not a subtype of `T1`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V1(int i) {}
extension type const V0(int i) implements V1 {}

V0 t1Instance = V0(0);
V1 t0Instance = V1(42);

const t1Default = const V0(1);

//# @T0 = V1
//# @T1 = V0
