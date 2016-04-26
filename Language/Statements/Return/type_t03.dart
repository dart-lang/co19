/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Let T be the static type of e and let f be the immediately
 * enclosing function.
 *    It is a static type warning if the body of f is marked async and the type
 * Future<flatten(T)> may not be assigned to the declared return type of f.
 * Otherwise, it is a static type warning if T may not be assigned to the
 * declared return type of f.
 *
 * @description Checks that a static type warning occurs if the type
 * Future<flatten(T)> may not be assigned to the declared return type of the
 * immediately enclosing function, marked async.
 *
 * @static-warning
 * @author a.semenov@unipro.ru
 */
import 'dart:async';
import '../../../Utils/async_utils.dart';

Future<int> foo() async {
  return 'a';  /// static type warning
}

main() {
  asyncStart();
  foo().then(
      (_) {
        asyncEnd();
      },
      onError: (e) {
        asyncEnd();
      }
  );
}
