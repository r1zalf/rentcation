enum ResultState { Loading, NoData, HasData, Error, Init }

extension ResultStateValidator on ResultState {
  bool get isInit => this == ResultState.Init;
  bool get isLoading => this == ResultState.Loading;
  bool get isNoData => this == ResultState.NoData;
  bool get isHasData => this == ResultState.HasData;
  bool get isError => this == ResultState.Error;
}
