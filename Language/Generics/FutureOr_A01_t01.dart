/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A generic type is a type which is introduced by a generic class
 * declaration or a generic type alias, or it is the type [FutureOr].
 * @description Checks that [FutureOr] can be generic.
 * @author iarkh@unipro.ru
 */
import "dart:async";
import "../../Utils/expect.dart";

main() {
  FutureOr x1;
  Expect.equals(
      typeOf<FutureOr<dynamic>>(),
      typeOf<FutureOr>()
  );

  FutureOr<int> x2 = 3;
  FutureOr<String> x3 = "123";
}
