// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a return statement `s` of the form `return e?;`. Let `S`
/// be the static type of `e`, if `e` is present, let `f` be the immediately
/// enclosing function, and let `T` be the declared return type of `f`.
/// ...
/// Case ⟨Asynchronous non-generator functions⟩. Consider the case where `f` is
/// an asynchronous non-generator function with future value type `Tv`.
/// ...
/// It is a compile-time error if `s` is `return e;`, `Tv` is `void`,
/// and `flatten(S)` is neither `void`, `dynamic`, `Null`.
///
/// @description Checks that it is a compile-time error if a statement of the
/// form `return e;` occurs in an asynchronous function whose return type is
/// `void`, `Future<void>`, `FutureOr<void>`, `Future<void>?`, or
/// `FutureOr<void>?` and `flatten(S)` is neither `void`, `dynamic`, nor `Null`,
/// where `S` is the static type of `e`.
/// @author sgrekhov22@gmail.com

import 'dart:async';

class MySubtypeFutureObject implements Future<Object?> {
  @override
  Stream<Object?> asStream() => Stream.fromIterable([]);

  @override
  Future<Object?> catchError(
    Function onError, {
    bool Function(Object error)? test,
  }) => Future<Object?>.value(null);

  @override
  Future<R> then<R>(
    FutureOr<R> Function(Object? value) onValue, {
    Function? onError,
  }) => Future<R>.value(null);

  @override
  Future<Object?> timeout(
    Duration timeLimit, {
    FutureOr<Object?> Function()? onTimeout,
  }) => Future<Object?>.value(null);

  @override
  Future<Object?> whenComplete(FutureOr<void> Function() action) =>
      Future<Object?>.value(null);
}

void f1<X extends Object?>(
  Object? v1,
  Future<Object?> v2,
  MySubtypeFutureObject v3,
  FutureOr<Object?> v4,
  X v5,
  Future<Object?>? v6,
  FutureOr<Object?>? v7,
  Future<Object>? v8,
  FutureOr<Object>? v9,
  Future<Never> v10
) async {
  if (1 > 2) {
    return v1;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v2;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v3;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v4;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v5;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v6;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v7;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v8;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v9;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v10;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

Future<void> f2<X extends Object?>(
    Object? v1,
    Future<Object?> v2,
    MySubtypeFutureObject v3,
    FutureOr<Object?> v4,
    X v5,
    Future<Object?>? v6,
    FutureOr<Object?>? v7,
    Future<Object>? v8,
    FutureOr<Object>? v9,
    Future<Never> v10
    ) async {
  if (1 > 2) {
    return v1;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v2;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v3;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v4;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v5;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v6;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v7;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v8;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v9;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v10;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

FutureOr<void> f3<X extends Object?>(
    Object? v1,
    Future<Object?> v2,
    MySubtypeFutureObject v3,
    FutureOr<Object?> v4,
    X v5,
    Future<Object?>? v6,
    FutureOr<Object?>? v7,
    Future<Object>? v8,
    FutureOr<Object>? v9,
    Future<Never> v10
    ) async {
  if (1 > 2) {
    return v1;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v2;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v3;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v4;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v5;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v6;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v7;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v8;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v9;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v10;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

Future<void>? f4<X extends Object?>(
    Object? v1,
    Future<Object?> v2,
    MySubtypeFutureObject v3,
    FutureOr<Object?> v4,
    X v5,
    Future<Object?>? v6,
    FutureOr<Object?>? v7,
    Future<Object>? v8,
    FutureOr<Object>? v9,
    Future<Never> v10
    ) async {
  if (1 > 2) {
    return v1;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v2;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v3;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v4;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v5;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v6;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v7;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v8;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v9;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v10;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

FutureOr<void>? f5<X extends Object?>(
    Object? v1,
    Future<Object?> v2,
    MySubtypeFutureObject v3,
    FutureOr<Object?> v4,
    X v5,
    Future<Object?>? v6,
    FutureOr<Object?>? v7,
    Future<Object>? v8,
    FutureOr<Object>? v9,
    Future<Never> v10
    ) async {
  if (1 > 2) {
    return v1;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v2;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v3;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v4;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v5;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v6;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v7;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v8;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v9;
//         ^^
// [analyzer] unspecified
// [cfe] unspecified
  }
  if (1 > 2) {
    return v10;
//         ^^^
// [analyzer] unspecified
// [cfe] unspecified
  }
}


main() {
  print(f1);
  print(f2);
  print(f3);
  print(f4);
  print(f5);
}
