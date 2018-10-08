/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>This test checks to see if focus methods work on a couple types of elements.</p>
      <hr>
      <p>
      <fieldset><legend id="1">Legend</legend><input id="input1" type="text"></fieldset>
      <label id="2">Label2<input id="input2" type="text"></label></td>
      <label id="3" for="input3">Label3</label><input id="input3" type="text">
      ''', treeSanitizer: new NullTreeSanitizer());

  var _log = [];
  log(message) => _log.add(message);

  document.getElementById("input1").onFocus.listen((_) => log('focused 1'));
  document.getElementById("input2").onFocus.listen((_) => log('focused 2'));
  document.getElementById("input3").onFocus.listen((_) => log('focused 3'));

  document.getElementById("1").focus();
  document.getElementById("2").focus();
  document.getElementById("3").focus();

  shouldBeList(_log, ['focused 1', 'focused 2', 'focused 3']);
}
