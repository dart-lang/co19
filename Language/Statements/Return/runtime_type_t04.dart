/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let S be the runtime type of o. In checked mode:
 *    • If the body of f is marked async it is a dynamic type error if o is not
 * null and Future<S> is not a subtype of the actual return type of f.
 *    • Otherwise, it is a dynamic type error if o is not null and the runtime
 * type of o is not a subtype of the actual return type of f.
 *
 * @description Checks that compile error is raised if o is
 * not null and Future<S> is not a subtype of the actual return type of the
 * immediately enclosing async function.
 *
 * @compile-error
 * @issue 26133
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';

var r = 'a';

Future<int> foo() async { return r; }

main() {
  asyncStart();
  foo().then(
      (_) {
        Expect.fail('Either runtime or compile error is expected');
      },
      onError: (e) {
        // TODO catch compile error as well
        Expect.isTrue(e is TypeError || e is CastError);
        asyncEnd();
      }
  );
}
