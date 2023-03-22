// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Annotation to specify on Struct subtypes to indicate that its
/// members need to be packed.
///
/// Valid values for memberAlignment are 1, 2, 4, 8, and 16.
///
/// @description Checks that valid values for memberAlignment are accepted
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "../../../Utils/expect.dart";

@Packed(1)
final class S1 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;
}

@Packed(2)
final class S2 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;
}

@Packed(4)
final class S4 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;
}

@Packed(8)
final class S8 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;
}

@Packed(16)
final class S16 extends Struct {
  @Double()
  external double x;
  @Int32()
  external int y;
}

void main() {
  Expect.equals(12, sizeOf<S1>());
  Expect.equals(12, sizeOf<S2>());
  Expect.equals(12, sizeOf<S4>());
  Expect.isTrue(sizeOf<S8>() >= 12);
  Expect.isTrue(sizeOf<S16>() >= 12);
}
