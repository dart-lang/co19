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

extension type const ExtInt(int _) {}

typedef ExtIntFunc1 = ExtInt Function(ExtInt _, [ExtInt __]);
typedef ExtIntFunc2 = ExtInt Function(ExtInt _, {ExtInt n});
typedef ExtIntFunc3 = ExtInt Function(ExtInt _, {required ExtInt n});

typedef IntFunc1 = int Function(int _, [int __]);
typedef IntFunc2 = int Function(int _, {int n});
typedef IntFunc3 = int Function(int _, {required int n});

void main() {
  const Check(ExtIntFunc1, expected: IntFunc1);
  const Check(ExtIntFunc2, expected: IntFunc2);
  const Check(ExtIntFunc3, expected: IntFunc3);
}
