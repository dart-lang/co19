// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
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
/// corresponding representation type
/// @author sgrekhov22@gmail.com

extension type const Check._(Object? _) {
  const Check(Object? object, {required Object? expected}) : _ = object,
      assert(identical(expected, object));
}

extension type const ExtInt1(int _) implements int {}
extension type const ExtInt2(int _) {}
extension type const ExtString1(String _) implements String {}
extension type const ExtString2(String _) {}
extension type const ExtList1<T>(List<T> _) implements List<T> {}
extension type const ExtList2<T>(List<T> _) {}
extension type const ExtMap1<K, V>(Map<K, V> _) implements Map<K, V> {}
extension type const ExtMap2<K, V>(Map<K, V> _) {}

void main() {
  // Base case.
  const Check(ExtInt1, expected: int);
  const Check(ExtInt2, expected: int);
  // Generics.
  const Check(ExtList1<int>, expected: List<int>);
  const Check(ExtList2<int>, expected: List<int>);
  const Check(List<ExtInt1>, expected: List<int>);
  const Check(List<ExtInt2>, expected: List<int>);
  const Check(ExtList1<ExtInt1>, expected: List<int>);
  const Check(ExtList1<ExtInt2>, expected: List<int>);
  const Check(ExtList2<ExtInt1>, expected: List<int>);
  const Check(ExtList2<ExtInt2>, expected: List<int>);
  // Multiple arguments.
  const Check(Map<ExtInt1, String>, expected: Map<int, String>);
  const Check(Map<ExtInt2, String>, expected: Map<int, String>);
  const Check(Map<ExtInt1, ExtString1>, expected: Map<int, String>);
  const Check(Map<ExtInt1, ExtString2>, expected: Map<int, String>);
  const Check(Map<ExtInt2, ExtString1>, expected: Map<int, String>);
  const Check(Map<ExtInt2, ExtString2>, expected: Map<int, String>);
  const Check(ExtMap1<int, String>, expected: Map<int, String>);
  const Check(ExtMap2<int, String>, expected: Map<int, String>);
  const Check(ExtMap1<int, ExtString1>, expected: Map<int, String>);
  const Check(ExtMap2<int, ExtString1>, expected: Map<int, String>);
  const Check(ExtMap1<int, ExtString2>, expected: Map<int, String>);
  const Check(ExtMap2<int, ExtString2>, expected: Map<int, String>);
  const Check(ExtMap1<ExtInt1, String>, expected: Map<int, String>);
  const Check(ExtMap1<ExtInt2, String>, expected: Map<int, String>);
  const Check(ExtMap2<ExtInt1, String>, expected: Map<int, String>);
  const Check(ExtMap2<ExtInt2, String>, expected: Map<int, String>);
  const Check(ExtMap1<ExtInt1, ExtString1>, expected: Map<int, String>);
  const Check(ExtMap1<ExtInt1, ExtString2>, expected: Map<int, String>);
  const Check(ExtMap1<ExtInt2, ExtString2>, expected: Map<int, String>);
  const Check(ExtMap1<ExtInt2, ExtString1>, expected: Map<int, String>);
  const Check(ExtMap2<ExtInt1, ExtString1>, expected: Map<int, String>);
  const Check(ExtMap2<ExtInt1, ExtString2>, expected: Map<int, String>);
  const Check(ExtMap2<ExtInt2, ExtString2>, expected: Map<int, String>);
  const Check(ExtMap2<ExtInt2, ExtString1>, expected: Map<int, String>);
  // Generic twice.
  const Check(List<List<ExtInt1>>, expected: List<List<int>>);
  const Check(List<List<ExtInt2>>, expected: List<List<int>>);
  const Check(List<ExtList1<int>>, expected: List<List<int>>);
  const Check(List<ExtList2<int>>, expected: List<List<int>>);
  const Check(ExtList1<List<int>>, expected: List<List<int>>);
  const Check(ExtList2<List<int>>, expected: List<List<int>>);
  const Check(ExtList1<List<ExtInt1>>, expected: List<List<int>>);
  const Check(ExtList1<List<ExtInt2>>, expected: List<List<int>>);
  const Check(ExtList2<List<ExtInt1>>, expected: List<List<int>>);
  const Check(ExtList2<List<ExtInt2>>, expected: List<List<int>>);
  const Check(List<ExtList1<ExtInt1>>, expected: List<List<int>>);
  const Check(List<ExtList1<ExtInt2>>, expected: List<List<int>>);
  const Check(List<ExtList2<ExtInt1>>, expected: List<List<int>>);
  const Check(List<ExtList2<ExtInt2>>, expected: List<List<int>>);
  const Check(ExtList1<ExtList1<int>>, expected: List<List<int>>);
  const Check(ExtList1<ExtList2<int>>, expected: List<List<int>>);
  const Check(ExtList2<ExtList1<int>>, expected: List<List<int>>);
  const Check(ExtList2<ExtList2<int>>, expected: List<List<int>>);
  const Check(ExtList1<ExtList1<ExtInt1>>, expected: List<List<int>>);
  const Check(ExtList1<ExtList1<ExtInt2>>, expected: List<List<int>>);
  const Check(ExtList1<ExtList2<ExtInt2>>, expected: List<List<int>>);
  const Check(ExtList2<ExtList1<ExtInt1>>, expected: List<List<int>>);
  const Check(ExtList2<ExtList1<ExtInt2>>, expected: List<List<int>>);
  const Check(ExtList2<ExtList2<ExtInt2>>, expected: List<List<int>>);
  const Check(ExtList2<ExtList2<ExtInt1>>, expected: List<List<int>>);
}
