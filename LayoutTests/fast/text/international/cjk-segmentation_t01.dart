/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test for CJK segmentation
 */
import "dart:html";
import "../../../testcommon.dart" as tc;
import "../../../testharness.dart";

const String htmlEL1 = r'''
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
''';

const String htmlEL2 = r'''
<p>Test Chinese Segmentation.
<div class="zh-CN-div" title="国务院 务 国务院 关于 关于 《 土地 土地 房屋 房屋 管理 管理 条例 条例 》">国务院关于《土地房屋管理条例》</div>
<div class="zh-CN-div" title="物价 物价 预期 预期 调控 调控 目标 目标 基本 基本 实现 实现">物价预期调控目标基本实现</div>
<div class="zh-CN-div" title="俄罗斯 罗斯 俄罗斯 总统 总统 ： 机场 机场 爆炸 爆炸 是 恐怖 恐怖 袭击 袭击">俄罗斯总统：机场爆炸是恐怖袭击</div>
<div class="zh-CN-div" title="春运 春运 5 天 ， 北京 北京 运送 运送 旅客 旅客 146 146 146 万">春运5天，北京运送旅客146万</div>
<ul id="console"></ul>
''';

void runTest(e) {
    var range = document.createRange();
    var divs = document.getElementsByClassName("zh-CN-div");
    var pass = true;
    for (var j = 0; j < divs.length; ++j) {
        DivElement div = divs[j] as DivElement;
        var length = div.text.length;
        var title = div.title.split(' ');
        for (var i = 0; i < length; ++i) {
            range.setStart(div.firstChild, i);
            range.setEnd(div.firstChild, i);
            range.expand('word');
            var actual = range.toString();
            shouldBe(actual, title[i], "$i");
        }
        div.style.display = "none";
    }
    checkTestFailures();
}

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    tc.addOnLoadListener(runTest);
}
