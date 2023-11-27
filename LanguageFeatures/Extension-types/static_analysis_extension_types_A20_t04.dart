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

typedef GenFunction<T> = X Function<X>(X x);
typedef ListFunction<T> = X Function<X>(List<X> v);
typedef MapFunction<T1, T2> = void Function<K, V>(Map<K, V> v);

extension type const ExtFuncGen<T>(GenFunction<T> _) {}
extension type const ExtFuncList<T>(ListFunction<T> _) {}
extension type const ExtFuncMap<K, V>(MapFunction<K, V> _) {}

void main() {
  const Check(ExtFuncGen<int>, expected: GenFunction<int>);
  const Check(ExtFuncList<String>, expected: ListFunction<String>);
  const Check(ExtFuncMap<String, num>, expected: MapFunction<String, num>);
  // Multiple arguments.
  const Check(Map<ExtFuncGen<String>, String>,
      expected: Map<GenFunction<String>, String>);
  const Check(Map<String, ExtFuncGen<String>>,
      expected: Map<String, GenFunction<String>>);
  const Check(Map<ExtFuncList<int>, ExtFuncGen<String>>,
      expected: Map<ListFunction<int>, GenFunction<String>>);
  const Check(Map<ExtFuncGen<String>, ExtFuncList<int>>,
      expected: Map<GenFunction<String>, ListFunction<int>>);
  const Check(ExtFuncMap<ExtFuncGen<String>, String>,
      expected: MapFunction<GenFunction<String>, String>);
  const Check(ExtFuncMap<String, ExtFuncGen<String>>,
      expected: MapFunction<String, GenFunction<String>>);
  const Check(ExtFuncMap<ExtFuncList<int>, ExtFuncGen<String>>,
      expected: MapFunction<ListFunction<int>, GenFunction<String>>);
  const Check(ExtFuncMap<ExtFuncGen<String>, ExtFuncList<int>>,
      expected: MapFunction<GenFunction<String>, ListFunction<int>>);
  // Generic twice.
  const Check(ExtFuncGen<List<int>>, expected: GenFunction<List<int>>);
  const Check(ExtFuncGen<ExtFuncList<int>>,
      expected: GenFunction<ListFunction<int>>);
  const Check(List<ExtFuncGen<int>>, expected: List<GenFunction<int>>);
  const Check(ExtFuncList<ExtFuncList<int>>,
      expected: ListFunction<ListFunction<int>>);
  const Check(ExtFuncList<ExtFuncList<ExtFuncGen<int>>>,
      expected: ListFunction<ListFunction<GenFunction<int>>>);
}
