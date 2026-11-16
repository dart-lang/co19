// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion In both the introductory declaration and augmentations, type
/// annotations and bounds may sometimes be omitted and are filled in
/// automatically by the compiler through various mechanisms. The compiler must
/// also check that an augmentation and introductory declaration have the same
/// type. And variable initializers need a downwards inference context type.
///
/// Those steps are ordered like so:
/// 1. Augmentations are applied. A declaration doesn't have meaningful type
///    system semantics until after augmentations are merged.
/// 2. Type inference fills in any omitted types in the introductory
///    declaration. This may come from override inference, inferring an
///    initializing formal from the corresponding field type, etc. Downwards and
///    upwards inference is applied to a variable declaration's type and
///    initializer. Any other uninferred types get a default type like `dynamic`
///    for type annotations or `Object?` for bounds.
/// 3. Omitted types and bounds in augmenting declarations are inherited from
///    the introductory declaration. Since an augmentation declaration must have
///    types in all of the same places as the introductory declaration, type
///    inheritance from the introductory declaration is sufficient to fill in
///    all omitted types. Downwards inference is applied to a variable
///    declaration's initializer.
/// 4. Augmentations are checked for "same type" conformance against the
///    introductory declaration.
///
/// @description Checks that the type of a variable declared by an augmentation
/// is inherited from the introductory getter declaration, and that this type is
/// used as the downwards inference context type of the initializer expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

double get x1;
augment final x1 = 1;

List<num> get x2;
augment final x2 = [1];

class C {
  static double get s1;
  static List<num> get s2;
  double get i1;
  List<num> get i2;
}

augment class C {
  augment static final s1 = 1;
  augment static final s2 = [1];
  augment final i1 = 1;
  augment final i2 = [1];
}

enum E {
  e0;
  static double get s1;
  static List<num> get s2;
  double get i1;
  List<num> get i2;
}

augment enum E {
  ;
  augment static final s1 = 1;
  augment static final s2 = [1];
  augment final i1 = 1;
  augment final i2 = [1];
}

main() {
  x1.expectStaticType<Exactly<double>>();
  x2.expectStaticType<Exactly<List<num>>>();
  Expect.equals(1.0, x1);
  Expect.isFalse(x2 is List<int>);

  C.s1.expectStaticType<Exactly<double>>();
  C.s2.expectStaticType<Exactly<List<num>>>();
  C().i1.expectStaticType<Exactly<double>>();
  C().i2.expectStaticType<Exactly<List<num>>>();
  Expect.equals(1.0, C.s1);
  Expect.isFalse(C.s2 is List<int>);
  Expect.equals(1.0, C().i1);
  Expect.isFalse(C().i2 is List<int>);

  E.s1.expectStaticType<Exactly<double>>();
  E.s2.expectStaticType<Exactly<List<num>>>();
  E.e0.i1.expectStaticType<Exactly<double>>();
  E.e0.i2.expectStaticType<Exactly<List<num>>>();
  Expect.equals(1.0, E.s1);
  Expect.isFalse(E.s2 is List<int>);
  Expect.equals(1.0, E.e0.i1);
  Expect.isFalse(E.e0.i2 is List<int>);
}
