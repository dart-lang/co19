/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Custom element wrappers in templates should be retained
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

class Custom extends HtmlElement {
  var expando;
  Custom.created() : super.created() {
    this.expando = 'present';
  }
}

main() {
  document.body.setInnerHtml('''
    <div id="container">
    <template>
    <x-custom></x-custom>
    </template>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  document.querySelector('template').content.ownerDocument
    .register('x-custom', Custom);

  var template = document.querySelector('template');
  var customElement = template.content.querySelector('x-custom');
  shouldBeEqualToString(customElement.expando, 'present');

  var container = document.getElementById('container');

  container.innerHtml = container.innerHtml;

  template = document.querySelector('template');
  customElement = template.content.querySelector('x-custom');
  shouldBeEqualToString(customElement.expando, 'present');
}
