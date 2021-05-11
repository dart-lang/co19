// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if:
/// A spread element in a map literal has a static type that is not [dynamic] and
/// not a subtype of [Map<Object, Object>].
/// @description Checks that compile error is not thrown if spread element in the
/// map is dynamic
/// @author iarkh@unipro.ru


import "../../Utils/expect.dart";

main() {
  dynamic x1;
  Map res;
  Expect.throws(() => res = {...x1});
}
