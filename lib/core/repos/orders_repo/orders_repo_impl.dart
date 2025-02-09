import 'package:dartz/dartz.dart';
import 'package:fruitsecommerce/core/errors/failures.dart';

import '../../../features/checkout/data/models/order_model.dart';
import '../../../features/checkout/domain/entites/order_entity.dart';
import '../../Service/data_service.dart';
import '../../utils/backend_endpoint.dart';
import 'orders_repo.dart';


class OrdersRepoImpl implements OrdersRepo {
  final DatabaseService dataBaseService;

  OrdersRepoImpl(this.dataBaseService);

  @override
  Future<Either<Failure, void>> addOrder({required OrderEntity order})async {
    try {
          await dataBaseService.addData(
            path: BackendEndpoint.addOrder,
            data: OrderModel.fromEntity(order).toJson(),
          );
          return const Right(null);
        } catch (e) {
          return Left(ServerFailure(e.toString()));
        }
      }
  }


