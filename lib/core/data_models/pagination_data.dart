class PaginationData {
  int total;
  int currentPage;
  int lastPage;
  int perPage;

  PaginationData({this.total, this.currentPage = 0, this.lastPage, this.perPage = 10});

  PaginationData.fromInstance(PaginationData pagination) {
    var i = pagination;
    PaginationData(
      currentPage: i.currentPage,
      perPage: i.perPage,
      total: i.total,
      lastPage: i.lastPage,
    );
  }

  @override
  String toString() {
    return 'PaginationData{total: $total, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage}';
  }
}
