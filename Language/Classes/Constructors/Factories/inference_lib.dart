// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The return type of a factory whose signature is of the form
/// `factory M` or the form `factory M.id` is `M` if `M` is not a generic type;
/// otherwise the return type `M<T1,..., Tn>` where `T1,...,Tn` are the type
/// parameters of the enclosing class.
/// @author sgrekhov22@gmail.com

sealed class C0<T extends Object> {
  const C0._();
  const factory C0.ok(T value) = D._;
}

class D<T extends Object> extends C0<T> {
  final T value;
  const D._(this.value) : super._();
}
