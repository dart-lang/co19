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
/// @description Check that at run time an extension type is identical to its
/// representation type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type const V<T>(T id) {}

V<String> t1Instance = V<String>("42");
String t0Instance = "1";

const t1Default = V<String>("0");

//# @T0 = String
//# @T1 = V<String>
