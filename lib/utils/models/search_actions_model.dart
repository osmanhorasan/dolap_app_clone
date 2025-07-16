class SearchActionsModel {
  bool? isSearch = true,
      isNotification = true,
      isShare = false,
      isFavorite = false,
      isSetting = false,
      isProfileShare = false;

  SearchActionsModel({
    this.isSearch,
    this.isNotification,
    this.isShare,
    this.isFavorite,
    this.isSetting,
    this.isProfileShare,
  });
}
