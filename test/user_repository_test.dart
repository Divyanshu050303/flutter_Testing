import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testing/usertest/user_madel.dart';
import 'package:testing/usertest/user_repository.dart';

class MockHTTPClient extends Mock implements Client {
}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;
  setUp(() =>
      () {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });
  group("User_Repository -", () {
    group("getUser Function", () {
      test(
          "given User Repository class when getUser function is called and status code is 200 then a userModel should we returned ",
              () =>
              () async {
            // arrange
            when(
                    () =>
                    mockHTTPClient.get(Uri.parse(
                        'https://jsonplaceholder.typicode.com/users/1'),)
            ).thenAnswer((invocation) async {
            return Response('''
            {
              "id": 1,
              "name": "Leanne Graham",
              "username": "Bret",
              "email": "Sincere@april.biz",
              "website": "hildegard.org"
            }
            ''', 200);
            });
            // act
            final user = await userRepository.getUser();
            // assert
            expect(user, isA<User>());
          });
      test(
          "given user Repository  class when getUser function is called and status code is not 200 then a exceptions is thrown",
              () =>
              () async {
                when(
                        () =>
                        mockHTTPClient.get(Uri.parse(
                            'https://jsonplaceholder.typicode.com/users/1'),)
                ).thenAnswer((invocation) async {
                  return Response('''
            {
           
            }
            ''', 500);
                });
            final user = await userRepository.getUser();
            expect(user, throwsException);
          });
    });
  });
}
