/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be the runtime type of o. In checked mode:
 *    • If the body of f is marked async it is a dynamic type error if o is not
 * null and Future<S> is not a subtype of the actual return type of f.
 *    • Otherwise, it is a dynamic type error if o is not null and the runtime type
 * of o is not a subtype of the actual return type of f.
 *
 * @description Checks that dynamic type error does not occur in immediately
 * enclosing async function if Future<S> is a subtype of the actual return
 * type of f, which is dynamic.
 *
 * @author a.semenov@unipro.ru
 */

import '../../../Utils/expect.dart';

var r = 3.14;

dynamic foo() async { return r; }

main() {
  asyncStart();
  foo().then(
      (_) {
        asyncEnd();
      },
      onError: (e) {
        Expect.fail("Caught unexpected exception $e");
      }
  );
}
