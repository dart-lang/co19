// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion
///  metadata:
///   (‘@’ qualified (‘.’ identifier)? (arguments)?)*
///   ;
/// @description Check that the bound type is used for annotation with the
/// default type argument
/// @author sgrekhov@unipro.ru

import 'dart:mirrors';
import 'syntax_lib1.dart';
import '../../Utils/expect.dart';

@B()
class Test1 {}

@Y()
class Test2 {}

@Z(3.14)
class Test3 {}

main() {
  Test1 test1 = new Test1();
  InstanceMirror im1 = reflect(test1);
  ClassMirror classMirror = im1.type;
  Expect.equals(1, classMirror.metadata.length);
  Expect.isTrue(classMirror.metadata[0].reflectee is B<dynamic>);

  Test2 test2 = new Test2();
  InstanceMirror im2 = reflect(test2);
  ClassMirror classMirror2 = im2.type;
  Expect.equals(1, classMirror2.metadata.length);
  Expect.isTrue(classMirror2.metadata[0].reflectee is Y<num>);
  Expect.isFalse(classMirror2.metadata[0].reflectee is Y<int>);
  Expect.isFalse(classMirror2.metadata[0].reflectee is Y<double>);

  Test3 test3 = new Test3();
  InstanceMirror im3 = reflect(test3);
  ClassMirror classMirror3 = im3.type;
  Expect.equals(1, classMirror3.metadata.length);
  Expect.isTrue(classMirror3.metadata[0].reflectee is Z<num>);
  Expect.isFalse(classMirror3.metadata[0].reflectee is Z<int>);
  Expect.isTrue(classMirror3.metadata[0].reflectee is Z<double>);
}
