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

extension type const Check._(Object? _) {
  const Check(Object? object, {required Object? expected}) : _ = object,
      assert(identical(expected, object));
}

typedef GenFunction = X Function<X>(X x);
typedef ListFunction = X Function<X>(List<X> v);
typedef MapFunction = void Function<K, V>(Map<K, V> v);

extension type const ExtFuncGen(GenFunction _) {}
extension type const ExtFuncList(ListFunction _) {}
extension type const ExtFuncMap(MapFunction _) {}

void main() {
  const Check(ExtFuncGen, expected: GenFunction);
  const Check(ExtFuncList, expected: ListFunction);
  const Check(ExtFuncMap, expected: MapFunction);

  const Check(List<ExtFuncGen>, expected: List<GenFunction>);
  const Check(Map<ExtFuncGen, String>, expected: Map<GenFunction, String>);
  const Check(Map<String, ExtFuncGen>, expected: Map<String, GenFunction>);
  const Check(Map<ExtFuncList, ExtFuncGen>,
      expected: Map<ListFunction, GenFunction>);
}
