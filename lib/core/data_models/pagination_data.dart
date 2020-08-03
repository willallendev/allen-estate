class PaginationData {
  final int total;
  final int currentPage;
  final int lastPage;
  final int perPage;

  const PaginationData(
      {this.total, this.currentPage, this.lastPage, this.perPage});

  @override
  String toString() {
    return 'PaginationData{total: $total, currentPage: $currentPage, lastPage: $lastPage, perPage: $perPage}';
  }
}
