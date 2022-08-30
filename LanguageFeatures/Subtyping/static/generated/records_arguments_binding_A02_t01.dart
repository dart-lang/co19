// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T0 is a subtype of a type T1 (written
/// T0 <: T1) when:
/// A record type A is a subtype of record type B iff they have same shape and
/// the types of all fields of A are subtypes of the corresponding field types
/// of B
/// 
/// @description Check that if type T0 is a record with the same shape that T1
/// and the types of all fields of T0 is subtype of of the corresponding field
/// types of T1 then T0 is subtype of T1. Check positional and named fields
/// @author sgrekhov22@gmail.com
///
/// @description Check that if type T0 is a subtype of a type T1, then instance
/// of T0 can be used as an argument of type T1
/// @author sgrekhov@unipro.ru
///
/// This test is generated from records_A02.dart and 
/// arguments_binding_x01.dart.
/// Don't modify it. If you want to change this test, change one of the files 
/// above and then run generator.dart to regenerate the tests.



// SharedOptions=--enable-experiment=records

(int x, double y, String, {int n1, String n2}) t0Instance =
  (n1: 1, n2: "n2", 42, 3.14, "");
(num, num z, String?, {num n1, String? n2}) t1Instance =
  (0, n1: 0, 0, n2: null, null);

const t1Default = (0, 0, null, {n1: 0.1, n2: ""});




namedArgumentsFunc1((num, num, String?, {num n1, String? n2}) t1, {(num, num, String?, {num n1, String? n2}) t2 = t1Default}) {}
positionalArgumentsFunc1((num, num, String?, {num n1, String? n2}) t1, [(num, num, String?, {num n1, String? n2}) t2 = t1Default]) {}

namedArgumentsFunc2<X>(X t1, {required X t2}) {}

class ArgumentsBindingClass {
  ArgumentsBindingClass((num, num, String?, {num n1, String? n2}) t1) {}

  ArgumentsBindingClass.named((num, num, String?, {num n1, String? n2}) t1, {(num, num, String?, {num n1, String? n2}) t2 = t1Default}) {}
  ArgumentsBindingClass.positional((num, num, String?, {num n1, String? n2}) t1, [(num, num, String?, {num n1, String? n2}) t2 = t1Default]) {}

  factory ArgumentsBindingClass.fNamed((num, num, String?, {num n1, String? n2}) t1, {(num, num, String?, {num n1, String? n2}) t2 = t1Default}) {
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
  namedArgumentsFunc1(t0Instance, t2: t0Instance);
  positionalArgumentsFunc1(t0Instance, t0Instance);

  // test class constructors
  ArgumentsBindingClass instance1 = new ArgumentsBindingClass(t0Instance);
  instance1 = new ArgumentsBindingClass.fNamed(t0Instance, t2: t0Instance);
  instance1 = new ArgumentsBindingClass.fPositional(t0Instance, t0Instance);
  instance1 = new ArgumentsBindingClass.named(t0Instance, t2: t0Instance);
  instance1 = new ArgumentsBindingClass.positional(t0Instance, t0Instance);

  // tests methods and setters
  instance1.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance1.positionalArgumentsMethod(t0Instance, t0Instance);
  instance1.testSetter = t0Instance;

  // test static methods
  ArgumentsBindingClass.namedArgumentsStaticMethod(t0Instance, t2: t0Instance);
  ArgumentsBindingClass.positionalArgumentsStaticMethod(t0Instance, t0Instance);

  // Test type parameters

  //# <-- NotGenericFunctionType
  // test generic functions
  namedArgumentsFunc2<(num, num, String?, {num n1, String? n2})>(t0Instance, t2: t0Instance);

  // test generic class constructors
  ArgumentsBindingGen<(num, num, String?, {num n1, String? n2})> instance2 = new ArgumentsBindingGen<(num, num, String?, {num n1, String? n2})>(t0Instance);
  instance2 = new ArgumentsBindingGen<(num, num, String?, {num n1, String? n2})>.fNamed(t0Instance, t2: t0Instance);
  instance2 = new ArgumentsBindingGen<(num, num, String?, {num n1, String? n2})>.named(t0Instance, t2: t0Instance);

  // test generic class methods and setters
  instance2.namedArgumentsMethod(t0Instance, t2: t0Instance);
  instance2.testSetter = t0Instance;
  //# -->
}
