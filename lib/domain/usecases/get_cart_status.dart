import '../repositories/cart_repository.dart';

class GetCartStatus {
  final CartRepository repository;

  GetCartStatus(this.repository);

  Future<bool> execute(String id) {
    return repository.isAddedToCart(id);
  }
}
