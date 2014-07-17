/**
 * after web-platform-tests/webstorage/event_local_oldvalue.html
 * @assertion: http://dev.w3.org/html5/webstorage/ 
 * @description oldValue property test of local event
 */
import 'dart:collection';
import 'dart:html';
import "../Utils/expectWeb.dart";

void main() {
    Queue expected = new Queue.from([null, 'user1', null]);
    void onStorageEvent(event) {
        assert_equals(event.oldValue, expected.removeFirst());
        if (expected.isEmpty) {
            asyncEnd();
        }
    }

    window.localStorage.clear();
    window.addEventListener('storage', onStorageEvent, false);
    var event = new StorageEvent('storage');
    asyncStart();
    var el = document.createElement("iframe");
    el.setAttribute('id', 'ifrm');
    el.setAttribute('src', '${testSuiteRoot}/webstorage/iframe/local_change_item_iframe.html');
    document.body.append(el);
}
