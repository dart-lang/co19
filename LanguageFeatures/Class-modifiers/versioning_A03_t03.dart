// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any post-feature library declaration which has a platform library
/// class marked base or final as a superinterface must be marked base, final or
/// sealed, and cannot be implemented locally, even if the superinterface chain
/// goes through a pre-feature library declaration, and even if that declaration
/// ignores the base modifier.
///
/// @description Checks that it is not an error to declare a `base mixin` from a
/// post-feature library on a platform library class marked `final` and the
/// superinterface chain goes through a pre-feature library declaration
/// @author sgrekhov22@gmail.com

import "versioning_pre_feature_lib.dart";

base mixin BaseMixinOnPreFeatureExtendsFinal on PreFeatureExtendsFinal {
  dynamic noSuchMethod(Invocation i) {}
}

base mixin BaseMixinOnPreFeatureImplementsFinal on PreFeatureImplementsFinal {
  dynamic noSuchMethod(Invocation i) {}
}

base mixin BaseMixinOnPreFeatureWithFinal on PreFeatureWithFinal {
  dynamic noSuchMethod(Invocation i) {}
}

main() {
  print(BaseMixinOnPreFeatureExtendsFinal);
  print(BaseMixinOnPreFeatureImplementsFinal);
  print(BaseMixinOnPreFeatureWithFinal);
}
