/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, i is a getter invocation. Let f be the result of
 * looking up getter m in o with respect to L. If o is an instance of Type
 * but e is not a constant type literal, then if f is a getter that forwards
 * to a static getter, getter lookup fails.
 * @description Check that if library object is an instance of Type but not a
 * constant type literal and result of method lookup forwards to a static
 * getter, then lookup fails
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/expect.dart';
import 'instance_of_type_lib.dart' as lib;

main() {
  dynamic o = new lib.C();
  Expect.throws(() {o.runtimeType.sg;}, (e) => e is NoSuchMethodError);
}
