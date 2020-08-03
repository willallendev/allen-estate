import 'package:allenrealestateflutter/core/data_models/pagination_data.dart';

class AsyncResult<T> {
  T data;
  Map<String, dynamic> meta;
  PaginationData pagination;

  AsyncResult({
    this.data,
    this.meta,
    this.pagination,
  });

  @override
  String toString() {
    return 'AsyncResult{data: $data, meta: $meta, pagination: $pagination}';
  }
}
