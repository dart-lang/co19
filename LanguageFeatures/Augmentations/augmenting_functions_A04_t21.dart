// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that an augmenting function or constructor's signature
/// matches an introductory signature if:
/// - It has the same number of type parameters with the same type parameter
///   names (same identifiers) and bounds (after type annotation inheritance),
///   if any (same types, even if they may not be written exactly the same in
///   case one of the declarations needs to refer to a type using an import
///   prefix).
/// - The return type (if not omitted) is the same as the augmented
///   declaration's return type.
/// - It has the same number of positional parameters as the introductory
///   declaration, and the same number of those are optional.
/// - It has the same set of named parameter names as the augmented declaration.
/// - For each corresponding pair of parameters:
///   - They have the same name. This is trivial for named parameters, but may
///     fail to hold for positional parameters.
///   - They have the same type (or the augmenting declaration omits the type).
///   - They both have the modifier `covariant`, or none of them have it.
///   - They both have the modifier `required`. or none of them have it.
/// ...
/// It's a compile-time error if:
/// - The signature of the augmenting function does not match the signature of
///   the augmented function.
///
/// @description Checks that it is not an error if a `covariant` modifier of
/// parameters of an augmentation exactly matches the original function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class C {
  num instanceMethod1(covariant num i) => i;
  num instanceMethod2([covariant num i = 1]) => i;
  num instanceMethod3({covariant num i = 1}) => i;
  num instanceMethod4({required covariant num i}) => i;
  T instanceMethod5<T>({required covariant T i}) => i;
}

augment class C {
  augment num instanceMethod1(covariant num i);
  augment num instanceMethod2([covariant num i = 1]);
  augment num instanceMethod3({covariant num i = 1});
  augment num instanceMethod4({required covariant num i});
  augment T instanceMethod5<T>({required covariant T i});
}

mixin M {
  num instanceMethod1(covariant num i) => i;
  num instanceMethod2([covariant num i = 1]) => i;
  num instanceMethod3({covariant num i = 1}) => i;
  num instanceMethod4({required covariant num i}) => i;
  T instanceMethod5<T>({required covariant T i}) => i;
}

augment mixin M {
  augment num instanceMethod1(covariant num i);
  augment num instanceMethod2([covariant num i = 1]);
  augment num instanceMethod3({covariant num i = 1});
  augment num instanceMethod4({required covariant num i});
  augment T instanceMethod5<T>({required covariant T i});
}

enum E {
  e1;
  num instanceMethod1(covariant num i) => i;
  num instanceMethod2([covariant num i = 1]) => i;
  num instanceMethod3({covariant num i = 1}) => i;
  num instanceMethod4({required covariant num i}) => i;
  T instanceMethod5<T>({required covariant T i}) => i;
}

augment enum E {
  ;
  augment num instanceMethod1(covariant num i);
  augment num instanceMethod2([covariant num i = 1]);
  augment num instanceMethod3({covariant num i = 1});
  augment num instanceMethod4({required covariant num i});
  augment T instanceMethod5<T>({required covariant T i});
}

class MA = Object with M;

// Check that the parameter is still covariant after augmentation
class D extends C {
  int instanceMethod1(int i) => i;
  int instanceMethod2([int i = 1]) => i;
  int instanceMethod3({int i = 1}) => i;
  int instanceMethod4({required int i}) => i;
}

class MA2 extends MA {
  int instanceMethod1(int i) => i;
  int instanceMethod2([int i = 1]) => i;
  int instanceMethod3({int i = 1}) => i;
  int instanceMethod4({required int i}) => i;
}

main() {
  Expect.equals(1, C().instanceMethod1(1));
  Expect.equals(2, C().instanceMethod2(2));
  Expect.equals(3, C().instanceMethod3(i: 3));
  Expect.equals(4, C().instanceMethod4(i: 4));
  Expect.equals(5, C().instanceMethod5<int>(i: 5));

  Expect.equals(1, D().instanceMethod1(1));
  Expect.equals(2, D().instanceMethod2(2));
  Expect.equals(3, D().instanceMethod3(i: 3));
  Expect.equals(4, D().instanceMethod4(i: 4));

  Expect.equals(1, MA().instanceMethod1(1));
  Expect.equals(2, MA().instanceMethod2(2));
  Expect.equals(3, MA().instanceMethod3(i: 3));
  Expect.equals(4, MA().instanceMethod4(i: 4));
  Expect.equals(5, MA().instanceMethod5<int>(i: 5));

  Expect.equals(1, MA2().instanceMethod1(1));
  Expect.equals(2, MA2().instanceMethod2(2));
  Expect.equals(3, MA2().instanceMethod3(i: 3));
  Expect.equals(4, MA2().instanceMethod4(i: 4));

  Expect.equals(1, E.e1.instanceMethod1(1));
  Expect.equals(2, E.e1.instanceMethod2(2));
  Expect.equals(3, E.e1.instanceMethod3(i: 3));
  Expect.equals(4, E.e1.instanceMethod4(i: 4));
  Expect.equals(5, E.e1.instanceMethod5<int>(i: 5));
}
