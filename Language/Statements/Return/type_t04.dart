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
 * @description Checks that no static warning occurs if the type of e may be
 * assigned to the declared return type of the immediately enclosing function.
 *
 * @static-clean
 * @author a.semenov@unipro.ru
  */
import 'dart:async';
import '../../../Utils/expect.dart';

abstract class I {}
class S implements I {}
class C extends S {}

Future<S> foo() async {  return new S(); }
Future<I> foo2() async { return new C(); }
Future<C> bar() async {  return new C(); }
Future bar2() async { return new C(); }

main() {
  asyncStart();
  Future.wait([foo(), foo2(), bar2()]).then(
      (_) {
        bar().then(
          (_) {
            asyncEnd();
          }, onError: (e) {
            asyncEnd();
          }
        );
      }
  );
}
