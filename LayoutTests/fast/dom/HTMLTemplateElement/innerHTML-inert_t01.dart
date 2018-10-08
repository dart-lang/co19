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
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  TemplateElement template = document.createElement('template');
  var div = document.createElement('div');
  var attemptedLoad = false;

  finish(_) {
    shouldBeFalse(attemptedLoad);
    asyncEnd();
  }
  asyncStart();

  template.innerHtml = '<img src="$root/../resources/abe.jpg">';
  (template.content.firstChild as Element).onLoad.listen(
      (_) => attemptedLoad = true);
  document.body.append(template);

  div.innerHtml = '<img src="$root/../resources/abe.png">';
  (div.firstChild as Element).onLoad.listen(finish);
  document.body.append(div);
}
