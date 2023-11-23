// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

part of 'expect.dart';

/// Auxiliary generic function typedef
typedef F<X> = void Function<Y extends X>();

/// Returns [F] function with the type parameter of the tested type
F<X> toF<X>(X x) => <Y extends X>() {};

/// Returns [Type] object for the given [X] type
Type typeOf<X>() => X;

/// Auxiliary function to check nnbd top merge overriding feature
class CheckTopMerge<T> {
  T Function(T) get f => (x) => x;
}

Type? _capturedTypeArgument;

// Auxiliary functions to check least and greatest closures
// See https://github.com/dart-lang/co19/issues/575#issuecomment-613542349
X captureTypeArgument<X>() {
  _capturedTypeArgument = X;
  throw "Error";
}

Type? get capturedTypeArgument {
  var result = _capturedTypeArgument;
  _capturedTypeArgument = null;
  return result;
}

/// Sound/Unsound null safety flags (formerly known as weak/strong mode)
bool get hasUnsoundNullSafety => const <Null>[] is List<Object>;
bool get hasSoundNullSafety => !hasUnsoundNullSafety;
