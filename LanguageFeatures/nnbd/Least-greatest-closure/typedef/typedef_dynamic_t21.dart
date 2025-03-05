// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The definitions of least and greatest closure are changed in null
/// safe libraries to substitute [Never] in positions where previously [Null
/// would have been substituted, and [Object?] in positions where previously
/// [Object] or [dynamic] would have been substituted.
///
/// @description Check that correct type is substituted for [typedef check<X> =
/// void Function<X1 extends X>()].
/// @note Read more about the least and greatest closure test template:
/// https://github.com/dart-lang/co19/issues/575#issuecomment-613542349
/// @author iarkh@unipro.ru
/// @Issue 44125

import "../../../../Utils/expect.dart";

typedef check<X> = void Function<X1 extends X>() Function();
typedef expected = void Function<X>() Function();

void main() {
  void f<X>(check<X> Function() g) => g();
  Expect.throws(() { f(() => captureTypeArgument()..call()); });
  Expect.equals(expected, capturedTypeArgument);
}
