/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for invalid input of setLineDash, getLineDash and
 * lineDashOffset
 */
import "dart:html";
import "../../testcommon.dart";

var NaN = double.nan;
var Inf = double.infinity;
var NegInf = double.negativeInfinity;

main() {
  dynamic canvas = document.createElement('canvas');
  document.body.append(canvas);
  canvas.setAttribute('width', '700');
  canvas.setAttribute('height', '700');
  var ctx = canvas.getContext('2d');
  var initialLineDash = [1.5, 2.5];
  var initialLineDashOffset = 1.5;

  resetLineDash() {
    ctx.setLineDash(initialLineDash);
    ctx.lineDashOffset = initialLineDashOffset;
  }

  trySettingLineDash(value) {
    resetLineDash();
    ctx.setLineDash(value);
    return ctx.getLineDash();
  }

  trySettingLineDashWithNoArgs() {
    resetLineDash();
    ctx.setLineDash();
    return ctx.getLineDash();
  }

  trySettingLineDashOffset(value) {
    resetLineDash();
    ctx.lineDashOffset = value;
    return ctx.lineDashOffset;
  }

  shouldBeList(trySettingLineDash([1, -1]), initialLineDash);
  shouldBeList(trySettingLineDash([1, Inf]), initialLineDash);
  shouldBeList(trySettingLineDash([1, NegInf]), initialLineDash);
  shouldBeList(trySettingLineDash([1, NaN]), initialLineDash);
  //shouldBeList(trySettingLineDash([1, 'string']), initialLineDash);
  shouldThrow(() => trySettingLineDashWithNoArgs());

  shouldBe(trySettingLineDashOffset(Inf), initialLineDashOffset);
  shouldBe(trySettingLineDashOffset(NegInf), initialLineDashOffset);
  shouldBe(trySettingLineDashOffset(NaN), initialLineDashOffset);
  //shouldBe(trySettingLineDashOffset('string'), initialLineDashOffset);
}
