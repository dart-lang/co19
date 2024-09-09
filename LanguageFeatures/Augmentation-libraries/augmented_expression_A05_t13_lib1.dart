// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The exact result of an `augmented` expression depends on what is
/// being augmented, but it generally follows the same rules as any normal
/// identifier:
/// ...
/// - Augmenting operators: When augmenting an operator, `augmented` refers to
///   the augmented operator method, which must be immediately invoked using
///   function call syntax. For example when augmenting `operator +` you would
///   use `augmented(1)` to call the augmented operator, and when augmenting
///   `operator []=` you would use the `augmented(key, value)` syntax.
///
/// @description Checks that `augmented(v)` inside of an augmenting operator
/// invokes an augmented operator `+` with `v` as an argument.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

part of 'augmented_expression_A05_t13.dart';
import '../../Utils/expect.dart';

augment class C {
  augment String operator +(Object other) {
    Expect.equals("C + $other", augmented(other));
    return "C: Augment1 + $other";
  }
}

augment mixin M {
  augment String operator +(Object other) {
    Expect.equals("M + $other", augmented(other));
    return "M: Augment1 + $other";
  }
}

augment enum E {
  augment e1;
  augment String operator +(Object other) {
    Expect.equals("E + $other", augmented(other));
    return "E: Augment1 + $other";
  }
}

augment extension Ext {
  augment String operator +(Object other) {
    Expect.equals("Ext + $other", augmented(other));
    return "Ext: Augment1 + $other";
  }
}
