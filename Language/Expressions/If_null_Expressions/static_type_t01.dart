/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of an if-null expression e of the form e1??e2 is
 * equivalent ... The static type of e is least upper bound (19.8.2) of the
 * static type of e1 and the static type of e2 .
 *
 * @description Check static type of expression e1??e2
 *
 * @author a.semenov@unipro.ru
 */
import '../../../Utils/expect.dart';
import '../../../Utils/dynamic_check.dart';

void static_int(int a){
}

void static_string(String a){
}

main() {
  static_int( 1 ?? 2 ); /// 01: Ok
  static_int( 1 ?? 2.0 ); /// 02: Ok
  checkTypeError(() => static_int( 1.0 ?? 2.0 )); /// 03: static type warning
  static_int( null ?? null );  /// 04: Ok
  static_int( null ?? 1 );  /// 05: Ok
  checkTypeError(() => static_int( null ?? 2.0 )); /// 06: static type warning
  checkTypeError(() => static_int( true ?? false )); /// 07: static type warning

  checkTypeError(() => static_string( 1 ?? 2 )); /// 07: static type warning
  static_string( 'aaa' ?? 'bbb' ); /// 08: Ok
  static_string( 'bbb' ?? 1 ); /// 09: Ok
  static_string( 'bbb' ?? null ); /// 10: Ok
  static_string( null ?? 'bbb' ); /// 11: Ok
  checkTypeError(() => static_string( 2.0 ?? 1 )); /// 12: static type warning

}
