/*
 * Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a property extraction i of the form new T#
 * proceeds as follows:
 * ...
 * If T is a deferred type with prefix p, then if p has not been successfully
 * loaded, a dynamic error occurs.
 * @description Check that it is a dynamic error T is a deferred type with
 * prefix p and p has not been successfully loaded
 * @author sgrekhov@unipro.ru
 */
import '../../../../Utils/dynamic_check.dart';
import 'deferred_type_lib.dart' deferred as p;

main() {
  checkDynamicError(() {
    var x = new p.C#;
  });
}
