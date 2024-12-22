import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/product_entity.dart';
import '../../../domin/entities/cart_entity.dart';
import '../../../domin/entities/cart_items_entites.dart';


part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);
  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExis(productEntity);
    var carItem = cartEntity.getCarItem(productEntity);
    if (isProductExist) {
      carItem.increasCount();
    } else {
      cartEntity.addCartItem(carItem);
    }
    emit(CartItemAdded());
  }

  void deleteCarItem(CartItemEntity carItem) {
    cartEntity.removeCarItem(carItem);
    emit(CartItemRemoved());
  }
}
