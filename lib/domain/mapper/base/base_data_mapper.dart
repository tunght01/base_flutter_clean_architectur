abstract class BaseDataMapper<M, E> {
  const BaseDataMapper();

  /// Map a single Data Model to a Domain Entity
  E mapToEntity(M data);

  /// Helper to map a list of Data Models to a list of Domain Entities
  List<E> mapToListEntity(List<M> dataList) {
    return dataList.map((e) => mapToEntity(e)).toList();
  }
}

/// Optional: if need map from entity to  data
mixin DataMapperMixin<R, E> on BaseDataMapper<R, E> {
  R mapToData(E entity);

  R? mapToNullableData(E? entity) {
    if (entity == null) {
      return null;
    }

    return mapToData(entity);
  }

  List<R>? mapToNullableListData(List<E>? listEntity) {
    return listEntity?.map(mapToData).toList();
  }

  List<R> mapToListData(List<E>? listEntity) {
    return mapToNullableListData(listEntity) ?? List.empty();
  }
}
