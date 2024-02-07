// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with the same shape as T1
/// and the type of each field of T0 is a subtype of the corresponding field
/// types of T1 then T0 is a subtype of T1. Check positional fields only
/// @author sgrekhov22@gmail.com

(int x, double y, String) t0Instance = (42, 3.14, "");
(num, num z, String?) t1Instance = (0, 0, null);

const t1Default = (0, 0, null);

//# @T0 = (int, double, String)
//# @T1 = (num, num, String?)
