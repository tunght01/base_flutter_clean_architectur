abstract class BaseDataMapper<M, E> {
  const BaseDataMapper();

  /// Map a single Data Model to a Domain Entity
  E mapToEntity(M data);

  /// Helper to map a list of Data Models to a list of Domain Entities
  List<E> mapToListEntity(List<M> dataList) {
    return dataList.map((e) => mapToEntity(e)).toList();
  }
}
