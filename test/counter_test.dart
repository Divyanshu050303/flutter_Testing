import 'package:flutter_test/flutter_test.dart';
import 'package:testing/counter.dart';

void main() {
  //pretest
  // setup is called before every test setup -> test ->setup -> test ->setup -> test ->
  // setup all called before all the test setup all -> test -> test -> test
  // setUp(() => null);
  // setUpAll(() => null);
  late final Counter counter;
  setUp(() => () {
        counter = Counter();
      });
  //testing

  group("Counter class - ", () {
    // given when then
    test(
        "Given counter class when it is instantiated then value if count should be 0",
        () => () {
              final val = counter.count;
              // assert
              expect(val, 0);
            });
    test(
        "Given counter class when it is incremented then the value of count should be 1",
        () => () {
              counter.incrementCounter();
              final val = counter.count;
              //assert
              expect(val, 1);
            });
    test(
        "Given counter class when it is decrement then the value of count should be 1",
        () => () {
              counter.decrementCounter();
              final val = counter.count;
              //assert
              expect(val, -1);
            });
  });
  //post test
  // tearDown(() => null);
  // tearDownAll(() => null);
}
