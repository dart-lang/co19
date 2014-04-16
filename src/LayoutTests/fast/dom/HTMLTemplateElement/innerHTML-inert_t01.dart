/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that setting HTMLTemplateElement.innerHtml uses the inert
 * document when creating elements
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var template = document.createElement('template');
  var div = document.createElement('div');
  var attemptedLoad = false;

  finish(_) {
    shouldBeFalse(attemptedLoad);
    asyncEnd();
  }
  asyncStart();

  template.innerHtml = '<img src="$root/../resources/abe.jpg">';
  template.content.firstChild.onLoad.listen((_) => attemptedLoad = true);
  document.body.append(template);

  div.innerHtml = '<img src="$root/../resources/abe.png">';
  div.firstChild.onLoad.listen(finish);
  document.body.append(div);
}
