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
/// @description Check that a superinterface of an extension type is not a
/// subtype of it
/// @author sgrekhov22@gmail.com

extension type const V0(int i) implements int {}

V0 t1Instance = V0(42);
int t0Instance = 0;

const t1Default = V0(1);

//# @T0 = int
//# @T1 = V0
