class PaginationData {
  int total;
  int currentPage;
  int lastPage;
  int perPage;

  PaginationData({this.total, this.currentPage = 1, this.lastPage, this.perPage = 10});

  PaginationData.fromInstance(PaginationData pagination, {int currentPage, int perPage, int total, int lastPage}) {
    var i = pagination;
    PaginationData(
      currentPage: currentPage ?? i.currentPage,
      perPage: perPage ?? i.perPage,
      total: total ?? i.total,
      lastPage: lastPage ?? i.lastPage,
    );
  }

  @override
  String toString() {
    return 'PaginationData{total: $total, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage}';
  }
}
