// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abi.current()
/// The ABI the Dart VM is currently running on.
///
/// @description Checks that this method returns the ABI the Dart VM is
/// currently running on
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import 'dart:io';
import "../../../Utils/expect.dart";

main() {
  final abi = Abi.current();
  Expect.isTrue(Abi.values.contains(abi));
  if (Platform.isAndroid) {
    Expect.isTrue(
        abi == Abi.androidArm ||
            abi == Abi.androidArm64 ||
            abi == Abi.androidIA32 ||
            abi == Abi.androidX64,
        abi.toString());
  }
  if (Platform.isFuchsia) {
    Expect.isTrue(
        abi == Abi.fuchsiaArm64 || abi == Abi.fuchsiaX64, abi.toString());
  }
  if (Platform.isIOS) {
    Expect.isTrue(abi == Abi.iosArm || abi == Abi.iosArm64 || abi == Abi.iosX64,
        abi.toString());
  }
  if (Platform.isLinux) {
    Expect.isTrue(
        abi == Abi.linuxArm ||
            abi == Abi.linuxArm64 ||
            abi == Abi.linuxX64 ||
            abi == Abi.linuxIA32 ||
            abi == Abi.linuxRiscv32 ||
            abi == Abi.linuxRiscv64,
        abi.toString());
  }
  if (Platform.isMacOS) {
    Expect.isTrue(abi == Abi.macosX64 || abi == Abi.macosArm64, abi.toString());
  }
  if (Platform.isWindows) {
    Expect.isTrue(
        abi == Abi.windowsArm64 ||
            abi == Abi.windowsIA32 ||
            abi == Abi.windowsX64,
        abi.toString());
  }
}
