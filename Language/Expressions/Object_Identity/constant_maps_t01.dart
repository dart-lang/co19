// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The predeﬁned Dart function identical() is deﬁned such that
/// identical(c1, c2) iff:
///  • c1 and c2 are constant maps that are deﬁned to be identical in the
///    speciﬁcation of literal map expressions.
/// @description Checks that constatnt maps are identical() if they have both
/// identical types and content.
/// @author kaigorodov

import "../../../Utils/expect.dart";

const nums1 = const <num, String>{};
const nums2 = const <num, String>{};
const ints1 = const <int, String>{};
const ints2 = const <int, String>{};
const doubles1 = const <double, String>{};
const doubles2 = const <double, String>{};

main() {
  Expect.isTrue(identical(nums1, nums2));
  Expect.isTrue(identical(ints1, ints2));
  Expect.isTrue(identical(doubles1, doubles2));

  Expect.isFalse(identical(nums1, ints1));
  Expect.isFalse(identical(nums1, doubles1));
  Expect.isFalse(identical(ints1, doubles1));
}
