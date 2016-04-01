/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
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
 * @description Checks that in checked mode it is a dynamic type error if o is
 * not null and Future<S> is not a subtype of the actual return type of the
 * immediately enclosing async function.
 *
 * @issue 26133
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/expect.dart';
import '../../../Utils/dynamic_check.dart';
import '../../../Utils/async_utils.dart';

var r = 'a';

Future<int> foo() async {  return r; }

main() {
  asyncStart();
  foo().then(
      (_) {
        Expect.isFalse(isCheckedMode());
        asyncEnd();
      },
      onError: (e) {
        Expect.isTrue(isCheckedMode());
        Expect.isTrue(e is TypeError);
        asyncEnd();
      }
  );
}
