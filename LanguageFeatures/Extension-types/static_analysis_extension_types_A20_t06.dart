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

extension type const ExtInt(int _) {}
extension type const ExtList<T>(List<T> _) {}

typedef ExtListFunc1 = ExtList<ExtInt> Function(ExtList<ExtInt> _,
    [ExtList<ExtInt> __]);
typedef ExtListFunc2 = ExtList<ExtInt> Function(ExtList<ExtInt> _,
    {ExtList<ExtInt> n});
typedef ExtListFunc3 = ExtList<ExtInt> Function(ExtList<ExtInt> _,
    {required ExtList<ExtInt> n});

typedef ErasedFunc1 = List<int> Function(List<int> _, [List<int> __]);
typedef ErasedFunc2 = List<int> Function(List<int> _, {List<int> n});
typedef ErasedFunc3 = List<int> Function(List<int> _, {required List<int> n});

void main() {
  const Check(ExtListFunc1, expected: ErasedFunc1);
  const Check(ExtListFunc2, expected: ErasedFunc2);
  const Check(ExtListFunc3, expected: ErasedFunc3);
}
