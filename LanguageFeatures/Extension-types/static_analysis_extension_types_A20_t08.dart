// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The extension type erasure of an extension type V is obtained by
/// recursively replacing every subterm of V which is an extension type by the
/// corresponding representation type.
///
/// Let X1 extends B1, .. Xs extends Bs be a declaration of the type parameters
/// of a generic entity (it could be a generic class, extension type, mixin,
/// typedef, or function). Let BBj be the extension type erasure of
/// Bj, for j in 1 .. s. It is a compile-time error if
/// X1 extends BB1, .. Xs extends BBs has any compile-time errors.
///
/// @description Check that the erasure of an extension type `V` is obtained by
/// recursively replacing every subterm of `V` which is an extension type by the
/// corresponding representation type.
/// @author sgrekhov22@gmail.com

class Check {
  const Check(Object? v, {required Object? eq})
      : assert(v == eq, "Not equal ${(v, eq: eq)}");
}

extension type const IntET1(int _) {}
extension type const IntET2(int _) implements int {}

extension type const MapET1<X>(Map<IntET1, X> _) {}
extension type const MapET2<X>(Map<IntET2, X> _) {}

void main() {
  const Check([MapET1<List<IntET1>>({})], eq: [<int, List<int>>{}]);
  const Check([MapET1<List<IntET2>>({})], eq: [<int, List<int>>{}]);
  const Check([MapET2<List<IntET1>>({})], eq: [<int, List<int>>{}]);
  const Check([MapET2<List<IntET2>>({})], eq: [<int, List<int>>{}]);
}
