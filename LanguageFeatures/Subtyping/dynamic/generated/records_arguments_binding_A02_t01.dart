// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
///
/// @description Check that if type T0 is a record with the same shape as T1
/// and the type of each field of T0 is a subtype of the corresponding field
/// types of T1 then T0 is a subtype of T1. Check positional and named fields
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from test_types/records_A02.dart and 
/// test_cases/arguments_binding_x01.dart. Don't modify it! 
/// If you need to change this test, then change one of the files above and then 
/// run generator/generator.dart to regenerate the tests.

import '../../utils/common.dart';

// SharedOptions=--enable-experiment=records

(int x, double y, String, {int n1, String n2}) t0Instance =
  (n1: 1, n2: "n2", 42, 3.14, "");

const t1Default = (0, 0, null, n1: 0.1, n2: "");

namedArgumentsFunc1((num, num, String?, {num n1, String? n2}) t1, {(num, num, String?, {num n1, String? n2}) t2 = t1Default}) {}
positionalArgumentsFunc1((num, num, String?, {num n1, String? n2}) t1, [(num, num, String?, {num n1, String? n2}) t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass((num, num, String?, {num n1, String? n2}) t1) {}

  ArgumentsBindingClass.named((num, num, String?, {num n1, String? n2}) t1, {(num, num, String?, {num n1, String? n2}) t2 = t1Default}) {}
  ArgumentsBindingClass.positional((num, num, String?, {num n1, String? n2}) t1, [(num, num, String?, {num n1, String? n2}) t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed((num, num, String?, {num n1, String? n2}) t1, {(num, num, String?, {num n1, String? n2}) t2  = t1Default}) {
    return new ArgumentsBindingClass.named(t1, t2: t2);
  }
  factory ArgumentsBindingClass.fPositional((num, num, String?, {num n1, String? n2}) t1, [(num, num, String?, {num n1, String? n2}) t2 = t1Default]) {
    return new ArgumentsBindingClass.positional(t1, t2);
  }

  static namedArgumentsStaticMethod((num, num, String?, {num n1, String? n2}) t1, {(num, num, String?, {num n1, String? n2}) t2 = t1Default}) {}
  static positionalArgumentsStaticMethod((num, num, String?, {num n1, String? n2}) t1, [(num, num, String?, {num n1, String? n2}) t2 = t1Default]) {}

  namedArgumentsMethod((num, num, String?, {num n1, String? n2}) t1, {(num, num, String?, {num n1, String? n2}) t2 = t1Default}) {}
  positionalArgumentsMethod((num, num, String?, {num n1, String? n2}) t1, [(num, num, String?, {num n1, String? n2}) t2 = t1Default]) {}

  set testSetter((num, num, String?, {num n1, String? n2}) val) {}
}

class ArgumentsBindingGen<X>  {
  ArgumentsBindingGen(X t1) {}

  ArgumentsBindingGen.named(X t1, {required X t2}) {}

  factory ArgumentsBindingGen.fNamed(X t1, {required X t2}) {
    return new ArgumentsBindingGen.named(t1, t2: t2);
  }

  namedArgumentsMethod(X t1, {required X t2}) {}

  set testSetter(X val) {}
}

main() {
  // test functions
  namedArgumentsFunc1(forgetType(t0Instance), t2: forgetType(t0Instance));
  positionalArgumentsFunc1(forgetType(t0Instance), forgetType(t0Instance));

  // test class constructors
  ArgumentsBindingClass instance1 =
      new ArgumentsBindingClass(forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1 = new ArgumentsBindingClass.positional(forgetType(t0Instance),
      forgetType(t0Instance));

  // tests methods and setters
  instance1.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance1.positionalArgumentsMethod(forgetType(t0Instance),
      forgetType(t0Instance));
  instance1.testSetter = forgetType(t0Instance);

  // test static methods
  ArgumentsBindingClass.namedArgumentsStaticMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  ArgumentsBindingClass.positionalArgumentsStaticMethod(
      forgetType(t0Instance), forgetType(t0Instance));

  // Test type parameters

  // test generic functions
  namedArgumentsFunc2<(num, num, String?, {num n1, String? n2})>(forgetType(t0Instance), t2: forgetType(t0Instance));

  // test generic class constructors
  ArgumentsBindingGen<(num, num, String?, {num n1, String? n2})> instance2 =
      new ArgumentsBindingGen<(num, num, String?, {num n1, String? n2})>(forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<(num, num, String?, {num n1, String? n2})>.fNamed(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2 = new ArgumentsBindingGen<(num, num, String?, {num n1, String? n2})>.named(forgetType(t0Instance),
      t2: forgetType(t0Instance));

  // test generic class methods and setters
  instance2.namedArgumentsMethod(forgetType(t0Instance),
      t2: forgetType(t0Instance));
  instance2.testSetter = forgetType(t0Instance);
}
