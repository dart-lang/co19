// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

var html_elements = [
  'a',
  'article',
  'aside',
  'audio',
  'br',
  'canvas',
  'div',
  'footer',
  'header',
  'hr',
  'iframe',
  'img',
  'li',
  'nav',
  'ol',
  'option',
  'p',
  'pre',
  'section',
  'select',
  'span',
  'svg',
  'table',
  'td',
  'textarea',
  'th',
  'tr',
  'ul',
  'video'
];

main() {
  print('''main () {
  var x;
  ''');

  for (var i in html_elements) {
    print('''
  x = new Element.$i();
  Expect.equals('${i.toUpperCase()}', x.tagName);
''');
  }

  print('}');
}
