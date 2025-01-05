

import 'package:mvvm_project/app/extension.dart';
import 'package:mvvm_project/data/responses/response.dart';
import 'package:mvvm_project/domain/model.dart';

const EMPTY = "";
const ZERO = 0;

extension CustomerResponseMapper on CustomResponse {
 Customer toDomain() {
  return Customer(
            id?.orZero().toString() ?? EMPTY,
            name.orEmpty(),
            numOfNotifications?.orZero() ?? ZERO
       
        
        );
 }
}