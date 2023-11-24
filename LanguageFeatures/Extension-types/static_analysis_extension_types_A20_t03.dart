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
/// corresponding representation type. Test function types
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type const Check._(Object? _) {
  const Check(Object? object, {required Object? expected}) : _ = object,
      assert(identical(expected, object));
}

typedef int IntFunction(int);
typedef T GenFunction<T>();
typedef List<T> ListFunction<T>();
typedef Map<K, V> MapFunction<K, V>();

extension type const ExtFuncInt(IntFunction _) {}
extension type const ExtFuncGen<T>(GenFunction<T> _) {}
extension type const ExtFuncList<T>(ListFunction<T> _) {}
extension type const ExtFuncMap<K, V>(MapFunction<K, V> _) {}

void main() {
  // Base case.
  const Check(ExtFuncInt, expected: IntFunction);
  // Generics.
  const Check(ExtFuncGen<int>, expected: GenFunction<int>);
  const Check(ExtFuncList<String>, expected: ListFunction<String>);
  const Check(ExtFuncMap<String, num>, expected: MapFunction<String, num>);
  // Multiple arguments.
  const Check(Map<ExtFuncInt, String>, expected: Map<IntFunction, String>);
  const Check(Map<ExtFuncInt, ExtFuncGen<String>>,
      expected: Map<IntFunction, GenFunction<String>>);
  const Check(ExtFuncMap<ExtFuncInt, ExtFuncGen<String>>,
      expected: MapFunction<IntFunction, GenFunction<String>>);
  // Generic twice.
  const Check(List<List<ExtFuncInt>>, expected: List<List<IntFunction>>);
  const Check(List<ExtFuncGen<int>>, expected: List<GenFunction<int>>);
  const Check(ExtFuncGen<List<int>>, expected: GenFunction<List<int>>);
  const Check(ExtFuncList<List<ExtFuncInt>>,
      expected: ListFunction<List<IntFunction>>);
  const Check(List<ExtFuncGen<ExtFuncInt>>,
      expected: List<GenFunction<IntFunction>>);
  const Check(ExtFuncList<ExtFuncList<int>>,
      expected: ListFunction<ListFunction<int>>);
  const Check(ExtFuncList<ExtFuncList<ExtFuncInt>>,
      expected: ListFunction<ListFunction<IntFunction>>);
}
