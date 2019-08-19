/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The NonNull function defines the null-promoted version of a type,
 * and is defined as follows.
 *     NonNull(Null) = Never
 *
 * @description Check that NonNull(Null) = Never.
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable

import "../../Utils/expect.dart";

main() {
  Expect.isTrue(NonNull(int) == int);
}
