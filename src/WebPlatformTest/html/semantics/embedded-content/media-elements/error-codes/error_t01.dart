/**
 * after web-platform-tests/html/semantics/embedded-content/media-elements/error-codes/error.html
 * @assertion 
 * @description error
 */
import 'dart:html';
import "../../../../../Utils/expectWeb.dart";
import "../../../../../common/media.dart";

void main() {

void error_test(tagName, src) {
  test(() {
    assert_equals(document.createElement(tagName).error, null);
  }, tagName + '.error initial value');

  test(() {
    var e = document.createElement(tagName);
    asyncStart();
    e.attributes["src"] = src;
    e.onLoad.last.then((e) {
      assert_equals(e.error, null);
      asyncEnd();
    });
  }, tagName + '.error after successful load');

  // TODO: MEDIA_ERR_ABORTED, MEDIA_ERR_NETWORK, MEDIA_ERR_DECODE

  test(() {
    var e = document.createElement(tagName);
    asyncStart();
    e.attributes["src"] = '';
    e.onLoad.last.then((e) {},
    onError:(e) {
      assert_true(e.error is MediaError);
      assert_equals(e.error.code, 4);
      assert_equals(e.error.code, e.error.MEDIA_ERR_SRC_NOT_SUPPORTED);
      asyncEnd();
    });
  }, tagName + '.error after setting src to the empty string');
}

error_test('audio', getAudioURI('$testSuiteRoot/media/sound_5'));
error_test('video', getVideoURI('$testSuiteRoot/media/movie_5'));
  
   checkTestFailures();
}
