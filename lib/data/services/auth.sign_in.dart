part of 'auth.dart';

extension _SignIn on AuthService {
  static const title = '로그인';
  // signIn({
  //   required SignInInput signInInput,
  //   BoolChanged<dynamic>? onSuccess,
  //   BoolChanged<String?>? onFailure,
  //   BoolChanged<String?>? onError,
  // }) async {
  //   try {
  //     bool? show = true;
  //     final result = await graphQLControlway.mutateHttp(_signInDocument,
  //         variables: {'input': signInInput.toMap()}, link: GraphQLLink.auth);
  //     if (result.exception?.graphqlErrors.isNotEmpty == true) {
  //       //* 실패
  //       if (onFailure != null) show = onFailure(result.exception?.graphqlErrors.first.message);
  //       if (show == true) showApiFailed(title: title, content: result.exception?.graphqlErrors.first.message);
  //     } else if (result.hasException) {
  //       //* 에러
  //       if (result.exception!.linkException is ServerException) {
  //         //* 서버 에러
  //         if (onError != null) show = onError(result.exception!.linkException.toString());
  //         if (show == true) showApiError(title: title, content: result.exception!.linkException.toString());
  //       } else {
  //         //* 내부 에러
  //         if (onError != null) show = onError(result.exception!.linkException.toString());
  //         if (show == true) showApiError(title: title, content: result.exception!.linkException.toString());
  //       }
  //     } else {
  //       //* 성공
  //       if (onSuccess != null) show = onSuccess(result.data);
  //       if (show == true) showSnackbar(title, '작업 성공!');
  //     }
  //   } catch (e) {
  //     //! throw 에러
  //     showCatchError(title: title, content: '$e');
  //   }
  // }
}
